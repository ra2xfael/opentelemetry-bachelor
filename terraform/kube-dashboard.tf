  resource "kubernetes_namespace" "kube-dashboard" {
    metadata {
      name = "kube-dashboard"
    }
  }

    resource "helm_release" "kubernetes-dashboard" {
    depends_on = [kubernetes_namespace.kube-dashboard]

    name = "kube-dashboard"
    repository = "https://kubernetes.github.io/dashboard/"
    chart = "kubernetes-dashboard"

    namespace = "kube-dashboard"
  }