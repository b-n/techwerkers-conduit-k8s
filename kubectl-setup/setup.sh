#!/usr/bin/env sh

# Usage: ./setup.sh [user]
# user defaults to "admin"

export CLUSTER_NAME=hetzner_tw-k8s_main
export CLUSTER_USER=${1:-admin}
export CLUSTER_SERVER=https://167.235.136.141:16443

kubectl config set-cluster $CLUSTER_NAME --certificate-authority=cluster.crt --embed-certs=true --server $CLUSTER_SERVER
kubectl config set-credentials ${CLUSTER_NAME}-${CLUSTER_USER} --client-certificate=$CLUSTER_USER-client.crt --client-key=$CLUSTER_USER-client.key --embed-certs=true
kubectl config set-context $CLUSTER_NAME --cluster=$CLUSTER_NAME --user=${CLUSTER_NAME}-${CLUSTER_USER}
