class softec_sysctl::aws {

  $shortname = inline_template("<%= clientcert.split('.').at(0) %>")

  sysctl::conf {'net_ipv4_ip_local_port_range':
    key   => 'net.ipv4.ip_local_port_range',
    value => '1024 65535',
  }

  sysctl::conf {'net_ipv4_tcp_max_syn_backlog':
    key   => 'net.ipv4.tcp_max_syn_backlog',
    value => '4096',
  }

  sysctl::conf {'net_ipv4_tcp_fin_timeout':
    key   => 'net.ipv4.tcp_fin_timeout',
    value => '30',
  }

  sysctl::conf {'kernel_hostname':
    key   =>'kernel.hostname',
    value => $shortname,
  }

}
