class sudo (
    $ensure         = params_lookup('ensure'),
    $manage_groups  = params_lookup('manage_groups'),
    $groups         = params_lookup('groups'),

    ) inherits sudo::params {

    Class['sudo'] -> Class['sudo::groups']

    file { '/etc/sudoers':
        owner   => root,
        group   => root,
        mode    => '0440',
        require => Package['sudo'],
    }

    file { '/etc/sudoers.d':
        ensure  => directory,
        force   => true,
        owner   => root,
        group   => root,
        mode    => '0440',
        require => Package['sudo'],
    }

    file { '/usr/bin/sudo':
        owner   => root,
        group   => root,
        mode    => '4755',
    }

    file { '/usr/sbin/visudo':
        owner   => root,
        group   => root,
        mode    => '0755',
    }

    package { 'sudo':
        ensure => $ensure,
    }

    class { 'ssh::groups':
        manage      => $manage_groups,
        groupps     => $groups,
    }

}

# vim: expandtab:ts=4
