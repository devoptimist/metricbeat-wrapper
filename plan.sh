pkg_name=metricbeat-wrapper
pkg_origin=devoptimist
pkg_version="6.3.1"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=("Apache-2.0")
pkg_deps=(devoptimist/metricbeat)
pkg_svc_user="root"
pkg_binds_optional=(
  [kibana]="port"
  [elasticsearch]="http-port"
  [logstash]="port"
)
pkg_description="Lightweight shipper for system metrics"
pkg_upstream_url="https://www.elastic.co/products/beats/metricbeat"

do_download() {
  return 0
}

do_unpack() {
  return 0
}

do_build() {
  return 0
}

do_install() {
  mkdir -p ${pkg_prefix}/config
  cp $(pkg_path_for devoptimist/metricbeat)/config/fields.yml ${pkg_prefix}/config/
  chown ${pkg_svc_user}:hab -R ${pkg_prefix}/config
}

do_setup_environment() {
  set_runtime_env METRICBEAT_USER ${pkg_svc_user}
  set_runtime_env METRICBEAT_PATH $(pkg_path_for devoptimist/metricbeat)
}
