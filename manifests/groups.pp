class sudo::groups {
  $groups = hiera('sudo_groups')

  # Create resources for sudo groups
  create_resources(sudo::group, $groups)
}
