# Public: Controls silent clicking
class osx::mouse::silent_trackpad(
  $enabled = true
) {

  $value = $enabled ? {
    false => 1,
    true  => 0
  }

  boxen::osx_defaults { 'Toggle silent clicking':
    user   => $::boxen_user,
    domain => 'com.apple.AppleMultitouchTrackpad',
    key    => 'ActuationStrength',
    value  => $value,
    type   => 'integer'
  }
}
