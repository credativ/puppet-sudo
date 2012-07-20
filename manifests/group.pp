# = Class: sudo::group
#
# Define to handle a group entry in /etc/sudoers
#
# == Parameters:
#
# [* ensure *]
#   weither sudo group shall be ensured to be 'present' or 'absent'
#
# [* group *]
#   specify the group name (defaults to: $title)
#
# [* host_group *]
#   specify the host_group of the sudo rule (see sudoers for an explanation
#   of Host_Aliases and their usage.
#   Default: ALL
#
# [* command *]
#   allows to specify whiche command the group may run
#   Default: ALL
#
# [* runas_user *]
#   specify which user the group may switch to.
#   Default: ALL
#
define sudo::group (
  $ensure = 'present',
  $group = $title,
  $host_group = 'ALL',
  $command='ALL',
  $runas_user='ALL',
  $tag = undef,
) {

  if $ensure == 'present' {
    augeas { "sudoers-grp-${group}":
      context => '/files/etc/sudoers',
      changes => template('sudo/sudo_group.erb')
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
