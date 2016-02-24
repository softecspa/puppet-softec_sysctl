# Simple sysctl settings for VM on AWS
class softec_sysctl::aws {

  $shortname = inline_template("<%= clientcert.split('.').at(0) %>")

  sysctl { 'net.ipv4.ip_local_port_range':
    ensure => present,
    value  => '1024 65535',
  }

  sysctl { 'net.ipv4.tcp_max_syn_backlog':
    ensure => present,
    value  => '4096',
  }

  sysctl { 'net.ipv4.tcp_fin_timeout':
    ensure => present,
    value  => '30',
  }

  sysctl { 'kernel.hostname':
    ensure => present,
    value  => $shortname,
  }

}
