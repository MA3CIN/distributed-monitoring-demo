helm install ueransim-gnb openverso/ueransim-gnb --version 0.2.5 --values gnb-ue-values.yaml
# Verify that NFs have connected to each other
kubectl logs deployment/open5gs-smf
kubectl logs deployment/open5gs-amf
kubectl logs deployment/ueransim-gnb