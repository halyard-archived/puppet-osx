# Public: Manages battery chime
class osx::sound::battery_chime (
  $enable = false
) {

  $value = $enable ? {
    false   => 0,
    default => 1
  }

  osx_default { 'Enable feedback on charging cable connection':
    domain => 'com.apple.PowerChime',
    key    => 'ChimeOnAllHardware',
    value  => $value,
    type   => 'boolean'
  }
}
