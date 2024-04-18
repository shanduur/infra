# Infra

<p align="center">
  <img src="./resources/kubernetes.png" alt="Kubernetes" width="256px"/></br>
  <a href="http://fluxcd.io" target="_blank"><img src="./resources/flux.png" height="32px"></a>
  <a href="https://www.mend.io/renovate/" target="_blank"><img src="./resources/renovate.png" height="32px"></a>
  <a href="http://kured.dev" target="_blank"><img src="./resources/kured.png" height="32px"></a>
  <a href="http://k3s.io" target="_blank"><img src="./resources/k3s.png" height="32px"></a>
  <a href="http://cilium.io" target="_blank"><img src="./resources/cilium.png" height="32px"></a>
  <a href="https://tailscale.com" target="_blank"><img src="./resources/tailscale.png" height="32px"></a>
  <a href="http://tetragon.io" target="_blank"><img src="./resources/tetragon.png" height="32px"></a>
  <a href="https://grafana.com/oss/grafana/" target="_blank"><img src="./resources/grafana.png" height="32px"></a>
  <a href="https://prometheus.io" target="_blank"><img src="./resources/prometheus.png" height="32px"></a>
</p>

## Infrastructure as Code with GitOps using Flux and Renovate

### Overview

This repository contains the infrastructure code for managing a Kubernetes cluster on Oracle Cloud Infrastructure (OCI) using GitOps principles. The deployment and configuration are orchestrated with Flux and automated updates are handled by Renovate.

### Getting Started

1. Clone this repository:

    ```bash
    git clone <repository_url>
    ```

3. Install k3s on your cluster using the provided script:

    ```bash
    ./scripts/k3sup.sh
    ```

3. Set up Flux on your cluster using the provided script:

    ```bash
    export GITHUB_TOKEN=<your github token>
    ./scripts/flux.sh
    ```

4. Customize your cluster configuration in the `clusters` directory.

5. Apply changes to your cluster by committing and pushing to this repository.

### Automated Updates

Renovate is configured to automatically check for updates to dependencies. Refer to `renovate.json` for configuration details.

### License

This repository is licensed under the [The Unlicense](LICENSE). Feel free to modify and adapt it for your needs.

### Contribution

Feel free to contribute by opening issues or submitting pull requests. Your feedback and contributions are highly appreciated!
