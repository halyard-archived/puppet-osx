# Set frequency in days for software update checks
class osx::software_update::frequency (
  $frequency = 1
) {
  boxen::osx_defaults { 'Check for updates daily':
    user   => $::boxen_user,
    domain => 'com.apple.SoftwareUpdate',
    key    => 'ScheduleFrequency',
    value  => $frequency,
    type   => 'integer'
  }
}
