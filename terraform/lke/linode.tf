provider "linode" {}

resource "linode_lke_cluster" "lke" {
  k8s_version = var.k8s_version
  label       = var.k8s_cluster_name
  region      = var.k8s_cluster_region

  tags = [
    "prod",
    "mothership",
  ]

  pool {
    type  = "g6-standard-1"
    count = 3
  }
}

resource "null_resource" "kubeconfig" {
  depends_on = [
    linode_lke_cluster.lke,
  ]

  triggers = {
    kubeconfig = md5(linode_lke_cluster.lke.kubeconfig)
    script     = filemd5("./scripts/kubeconfig.sh")
  }

  provisioner "local-exec" {
    command = "./scripts/kubeconfig.sh '${var.kubeconfig}' '${linode_lke_cluster.lke.id}' '${linode_lke_cluster.lke.kubeconfig}'"
  }
}
