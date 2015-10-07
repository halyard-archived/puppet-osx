# Set path and name for screensaver
class osx::screensaver::set (
  $screensaver = undef,
  $path        = undef
) {
  osx_default { 'Set screensaver':
    host   => 'currentHost',
    domain => 'com.apple.screensaver',
    key    => 'moduleDict',
    value  => [
        ['moduleName', 'string', $screensaver],
        ['path', 'string', $path],
        ['type', 'integer', 0]
    ],
    type   => 'dict',
  }
}
