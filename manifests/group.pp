define sudo::group (
  $ensure = 'present',
  $group = $title,
  $host_group = 'ALL',
  $command='ALL',
  $runas_user='ALL'
) {

  if $ensure == 'present' {
    augeas { "sudoers-grp-${group}":
      context => '/files/etc/sudoers',
      changes => [
        "set spec[user = '%${group}']/user %${group}",
        "set spec[user = '%${group}']/host_group/host ${host_group}",
        "set spec[user = '%${group}']/host_group/command ${command}",
        "set spec[user = '%${group}']/host_group/command/runas_user ${runas_user}",
      ],
    }
  } elsif $ensure == 'absent' {
    augeas { "sudoers-grp-${group}":
      context => '/files/etc/sudoers',
      changes => [
        "rm spec[*][user = '%${group}']"
      ]
    }
  }
}
