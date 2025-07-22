resource "kubernetes_namespace" "otel-zoo" {
  metadata {name = "otel-zoo"}
}

resource "helm_release" "opentelemetry-demo" {
  depends_on = [kubernetes_namespace.otel-zoo]

  name = "opentelemetry-zoo"
  repository = "https://open-telemetry.github.io/opentelemetry-helm-charts"
  chart = "opentelemetry-demo"

  namespace = "otel-zoo"
}