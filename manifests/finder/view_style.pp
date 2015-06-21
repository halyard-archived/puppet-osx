class osx::finder::view_style(
  $style = 'Nlsv'
) {
  boxen::osx_defaults { 'Set view style in finder':
    user   => $::boxen_user,
    domain => 'com.apple.Finder',
    key    => 'FXPreferredViewStyle',
    value  => $style,
    type   => 'string'
  }
}
