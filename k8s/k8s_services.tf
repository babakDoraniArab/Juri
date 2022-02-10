resource "kubernetes_service" "nginx" {
  metadata {
    name = "nginx"
    annotations = {
      "service.beta.kubernetes.io/aws-load-balancer-type" : "lb",
      "service.beta.kubernetes.io/aws-load-balancer-cross-zone-load-balancing-enabled" : "true",
      "service.beta.kubernetes.io/aws-load-balancer-backend-protocol" : "http" ,
      "service.beta.kubernetes.io/aws-load-balancer-security-groups" : "sg-00a5f0bb3d525c4a0",
    }
  }
  spec {
    selector = {
      app = "nginx"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
