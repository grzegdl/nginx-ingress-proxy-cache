#!/usr/bin/env bash

version=1.25.0
namespace=nginx-ingress-caching
rls_name=$namespace

if ! [[ $1 =~ ^(deploy|update)$ ]]; then
        echo "$0 <deploy|update>
        deploy - installs the service
        update - updates existing service"
        exit 1
fi

set -ueo pipefail

common () {
  kubectl apply -f ingress-*.yaml
  kubectl apply -f service-*.yaml
}

if [[ $1 == "deploy" ]]; then
	helm install --version $version --name $rls_name --namespace=$namespace -f values.yaml stable/nginx-ingress
  common

elif [[ $1 == "update" ]]; then
	helm upgrade --version $version --install $rls_name --namespace=$namespace -f values.yaml stable/nginx-ingress
  common
fi

