# Public: Manages battery chime
class osx::sound::battery_chime (
  $enable = false
) {

  osx_default { 'Enable feedback on charging cable connection':
    domain => 'com.apple.PowerChime',
    key    => 'ChimeOnAllHardware',
    value  => $enable,
    type   => 'boolean'
  }
}
