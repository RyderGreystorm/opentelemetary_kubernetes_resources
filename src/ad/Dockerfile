FROM eclipse-temurin:21-jdk AS builder

WORKDIR /usr/src/app

COPY . .

RUN chmod +x gradlew
RUN ./gradlew
RUN ./gradlew downloadRepos

COPY ./pb ./proto
RUN ./gradlew installDist -PprotoSourceDir=./proto

#####################################################
# Run stage
#####################################################

FROM eclipse-temurin:21-jre AS release

WORKDIR /usr/src/app
COPY --from=builder /usr/src/app .

ENV AD_PORT=8080
ENV FEATURE_FLAG_GRPC_SERVICE_ADDR=featureflagservice:50053

ENTRYPOINT [ "./build/install/opentelemetry-demo-ad/bin/Ad" ]