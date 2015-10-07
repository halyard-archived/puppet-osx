# Public: Sets function keys to be standard function keys
# (instead of always sending Fn). Requires re-login.
class osx::global::enable_standard_function_keys($enabled = true)  {
  boxen::osx_defaults { 'Keyboard, Use all Fn keys as standard function keys':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'com.apple.keyboard.fnState',
    type   => 'boolean',
    value  => $enabled,
    user   => $::boxen_user;
  }
}
