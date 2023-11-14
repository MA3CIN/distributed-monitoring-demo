./scripts/setup-minikube.sh
echo "----- Minikube setup finished -----"
./scripts/install-cilium.sh
echo "----- Cilium setup finished -----"
./scripts/install-hubble.sh
echo "----- Hubble setup finished -----"

hubble status

hubble observe