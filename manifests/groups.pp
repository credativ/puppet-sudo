# = Class: sudo::groups
#
# Create a bunch of sudo::group resources from a given hash of hashes with
# name_of_group => group_attribute pairs.
#
# See sudo::group for further information.
#

class sudo::groups (
    $ensure,
    $groups = undef,
    ) {

    if $ensure {
        # Create resources for sudo groups
        create_resources(sudo::group, $groups)
    }
}
