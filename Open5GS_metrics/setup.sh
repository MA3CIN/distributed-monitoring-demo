# Helm Open5GS
helm repo add openverso https://gradiant.github.io/openverso-charts/
helm install openverso/open5gs

# Prometheus operator
# kubectl create -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/master/bundle.yaml
# kubectl apply -f Prometheus/rbac_prometheus.yaml
# kubectl apply -f Prometheus/deploy.yaml
# kubectl apply -f Prometheus/svc_prometheus.yaml
# kubectl apply -f Prometheus/service_monitor_prometheus.yaml

# Prometheus operator, the Helm way
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install -f helm-prometheus-scrape-config.yaml prometheus prometheus-community/prometheus

# Port forward prometheus
export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=prometheus,app.kubernetes.io/instance=prometheus" -o jsonpath="{.items[0].metadata.name}")
kubectl --namespace default port-forward $POD_NAME 9090

# Uninstall chart
# helm uninstall prometheus