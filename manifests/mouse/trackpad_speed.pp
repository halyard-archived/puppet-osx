# Public: Sets movement speed for trackpad
class osx::mouse::trackpad_speed(
  $speed = 6
) {
  boxen::osx_defaults { 'Set trackpad speed':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'com.apple.trackpad.scaling',
    value  => $speed,
    type   => 'integer'
  }
}
