class sudo::groups (
    $ensure,
    $groups,
    ) {

    if $ensure {
        # Create resources for sudo groups
        create_resources(sudo::group, $groups)
    }
}

