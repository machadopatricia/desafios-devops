#!/bin/bash
set -e

NAMESPACE="idapp"

kubectl get namespace $NAMESPACE >/dev/null 2>&1 || kubectl create namespace $NAMESPACE
helm upgrade --install $NAMESPACE ./ --namespace $NAMESPACE 
