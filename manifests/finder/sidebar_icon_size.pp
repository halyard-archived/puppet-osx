class osx::finder::sidebar_icon_size (
  $size = 1
) {
  boxen::osx_defaults { 'Set sidebar icon size':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'NSTableViewDefaultSizeMode',
    value  => $size,
    type   => 'integer'
  }
}
