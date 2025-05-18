FROM golang:1.22-alpine AS builder

WORKDIR /usr/src/app

COPY . .

RUN go mod download

RUN go build -o product-catalog ./
#####################################################
# RUNTIME STAGE
#####################################################

FROM alpine AS release

WORKDIR /usr/bin/app

COPY --from=builder /usr/src/app/product-catalog ./
COPY ./products ./products

# For security, Let us run this container as a non-root user
RUN adduser -D -g '' appuser
RUN chown -R appuser:appuser /usr/bin/app

USER appuser


EXPOSE ${PRODUCT_CATALOG_PORT}
ENTRYPOINT [ "./product-catalog" ]