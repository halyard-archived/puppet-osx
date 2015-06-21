class osx::global::clock_format(
  $format = 'EEE MMM d  H:mm:ss'
) {
  boxen::osx_defaults { 'Configure clock format string':
    user   => $::boxen_user,
    domain => 'com.apple.menuextra.clock',
    key    => 'DateFormat',
    value  => $format,
    type   => 'string'
  }
}
