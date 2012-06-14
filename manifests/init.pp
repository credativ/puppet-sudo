# = Class: sudo
#
# Ensure and manage group entries in the sudoers file
#
# == Parameters
#
# [* manage_groups *]
#   Weither to manage sudo groups or not. Default: true
#
# [* groups *]
#   Specify the groups the sudo module shall manage. Needs to be
#   a hash of hashes, with groupname as key and a hash describing the
#   group as value. See the sudo::group documentation for details about
#   the allowed keys and defaults.
#         
# == Usage
# 
#
# class {'sudo':
#   groups  => { "sudo_users": {} }
#

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
        owner   => root,
        group   => root,
        mode    => '0755',
    }

    package { 'sudo':
        ensure => $ensure,
    }

    class { 'sudo::groups':
        manage      => $manage_groups,
        groupps     => $groups,
    }
}
