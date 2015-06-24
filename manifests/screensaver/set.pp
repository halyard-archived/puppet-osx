class osx::screensaver::set (
  $screensaver = undef,
  $path        = undef
) {
  $value = "moduleName -string 'Hyperspace' path -string '/Users/$::boxen_user/Library/Screen Savers/Hyperspace.saver' type -int 0"
  osx_default { 'Set screensaver':
    host   => 'currentHost',
    domain => 'com.apple.screensaver',
    key    => 'moduleDict',
    value  => [
        ['moduleName', '-string', $screensaver],
        ['path', '-string', $path],
        ['type', '-int', 0]
    ],
    type   => 'dict',
  }
}
