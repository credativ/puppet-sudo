# = Class: sudo::params
#
# Defaults for the sudo class.

class sudo::params {
    $ensure         = true
    $manage_groups  = true
    $groups         = undef
}

