class osx::global::ui_mode (
  $mode = 'Dark'
) {
  boxen::osx_defaults { 'Set UI mode':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'AppleInterfaceStyle',
    value  => $mode,
    type   => 'string'
  }
}
