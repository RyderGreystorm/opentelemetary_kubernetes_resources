#!/bin/bash

kubectl apply -k "github.com/kubernetes-sigs/gateway-api/config/crd/standard?ref=v1.0.0"

# If you have not enabled the Gateway API feature when installing the AWS Load Balancer Controller, you can enable it by running the following command:
# Note: This command assumes you have already installed the AWS Load Balancer Controller using Helm and have the necessary permissions to modify the release.
helm upgrade aws-load-balancer-controller eks/aws-load-balancer-controller \
  --set enableGatewayAPI=true \
  --reuse-values