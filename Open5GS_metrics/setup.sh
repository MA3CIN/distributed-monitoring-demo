# Helm Open5GS
helm repo add openverso https://gradiant.github.io/openverso-charts/
helm install --values open5gs-enable-metrics.yaml open5gs openverso/open5gs


# debug install
# helm install --values open5gs-enable-metrics.yaml open5gs openverso/open5gs --debug --dry-run

# Prometheus operator
# kubectl create -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/master/bundle.yaml
# kubectl apply -f Prometheus/rbac_prometheus.yaml
# kubectl apply -f Prometheus/deploy.yaml
# kubectl apply -f Prometheus/svc_prometheus.yaml
# kubectl apply -f Prometheus/service_monitor_prometheus.yaml

# Prometheus operator, the Helm way
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install prometheus prometheus-community/kube-prometheus-stack 
# helm install -f helm-prometheus-scrape-config.yaml prometheus prometheus-community/prometheus

# Port forward prometheus svc
kubectl port-forward svc/prometheus-operated 9090:9090

# Uninstall chart
# helm uninstall prometheus