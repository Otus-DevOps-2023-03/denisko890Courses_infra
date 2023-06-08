output "external_ip_address_app" {
  value = [
    for vm in yandex_compute_instance.app :
    "${vm.name}: ${vm.network_interface.0.nat_ip_address}"
  ]
}
output "reddit-lb-address" {
  value = yandex_lb_network_load_balancer.reddit-lb.listener.*.external_address_spec[0].*.address
}
