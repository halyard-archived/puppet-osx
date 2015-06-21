class osx::finder::default_path(
  $path = "file:///Users/${::boxen_user}"
) {
  boxen::osx_defaults { 'Set Finder default path type':
    user   => $::boxen_user,
    domain => 'com.apple.finder',
    key    => 'NewWindowTarget',
    value  => 'PfLo',
    type   => 'string'
  }

  boxen::osx_defaults { 'Set Finder default path':
    user   => $::boxen_user,
    domain => 'com.apple.finder',
    key    => 'NewWindowTargetPath',
    value  => $path,
    type   => 'string'
  }
}
