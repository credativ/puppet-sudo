# = Class: sudo::params
#
# Defaults for the sudo class.

class sudo::params {
    $ensure         = present
    $manage_groups  = true
    $groups         = undef
}

