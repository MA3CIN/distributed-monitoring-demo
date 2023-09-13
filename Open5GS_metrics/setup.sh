# Helm Open5GS
helm repo add openverso https://gradiant.github.io/openverso-charts/
helm install openverso/open5gs

# Prometheus operator
kubectl create -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/master/bundle.yaml
kubectl apply -f Prometheus/rbac_prometheus.yaml
kubectl apply -f Prometheus/deploy.yaml
kubectl apply -f Prometheus/svc_prometheus.yaml
kubectl apply -f Prometheus/service_monitor_prometheus.yaml