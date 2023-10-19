#Create kind cluster
kind create cluster

# Prometheus operator, the Helm way
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install prometheus prometheus-community/kube-prometheus-stack 

# Helm Open5GS
helm repo add openverso https://gradiant.github.io/openverso-charts/
helm install --version 2.1.0 --values open5gs-enable-metrics.yaml open5gs openverso/open5gs

# Display localhost Grafana user and pass
kubectl get secret prometheus-grafana -o jsonpath='{.data.admin-user}' | base64 --decode
kubectl get secret prometheus-grafana -o jsonpath='{.data.admin-password}' | base64 --decode

# Port forward prometheus & grafana svc
# kubectl wait --for=condition=ready pod -l app.kubernetes.io/instance=prometheus-kube-prometheus-prometheus --timeout=60s  
# kubectl port-forward svc/prometheus-operated 9090:9090

# kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=grafana --timeout=60s  
# kubectl port-forward svc/prometheus-grafana 8080:80

# xdg-open http://localhost:8080

# debug install
# helm install --values open5gs-enable-metrics.yaml open5gs openverso/open5gs --debug --dry-run > output.txt