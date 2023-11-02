#!/bin/bash

# Get the names of the pods in your Kubernetes deployment
pod_names=$(kubectl get pods -o custom-columns=":metadata.name" --no-headers)

# Iterate through the list of pod names and show their logs
for pod_name in $pod_names; do
    echo "Logs for pod: $pod_name"
    kubectl logs "$pod_name"
    echo "---------------------------"
done
