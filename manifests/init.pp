class sudo {
  file { '/etc/sudoers':
    owner   => 'root',
    group   => 'root',
    mode    => '0440',
    require => Package['sudo'],
  }

  file { '/etc/sudoers.d':
    ensure  => directory,
    force   => true,
    owner   => 'root',
    group   => 'root',
    mode    => '0440',
    require => Package['sudo'],
  }

  file { '/usr/bin/sudo':
    owner   => 'root',
    group   => 'root',
    mode    => '4755',
  }

  file { '/usr/sbin/visudo':
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
  }

  package { 'sudo':
    ensure => present,
  }
}
