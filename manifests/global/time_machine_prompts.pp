class osx::global::time_machine_prompts(
  $enable = false
) {
  $value = $enabled ? {
    true => false,
    default  => true
  }

  boxen::osx_defaults { 'Configure Time Machine prompts for new drives':
    user   => $::boxen_user,
    domain => 'com.apple.TimeMachine',
    key    => 'DoNotOfferNewDisksForBackup',
    value  => $value,
    type   => 'boolean'
  }
}
