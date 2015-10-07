# Set start delay in seconds for screensaver
class osx::screensaver::start_delay(
  $delay = 300
) {
  boxen::osx_defaults { 'Change screensaver start time':
    host   => 'currentHost',
    user   => $::boxen_user,
    domain => 'com.apple.screensaver',
    key    => 'idleTime',
    value  => $delay,
    type   => 'integer'
  }
}
