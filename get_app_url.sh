MINIKUBE_IP=$(minikube ip)
SERVICE_PORT=$(kubectl get service myapp-svc -o=jsonpath='{.spec.ports[0].nodePort}')
APP_URL="http://${MINIKUBE_IP}:${SERVICE_PORT}"
echo "Access your application at: $APP_URL"