resource "kubernetes_namespace" "chaos-mesh" {
  metadata {
    name = "chaos-mesh"
  }
}

resource "helm_release" "chaos-mesh" {
  depends_on = [kubernetes_namespace.chaos-mesh]

  name = "chaos-mesh"
  repository = "https://charts.chaos-mesh.org"
  chart = "chaos-mesh"

  namespace = "chaos-mesh"
}