# Public: Manages volume change feedback
class osx::sound::volume_change_feedback (
  $enable = true
) {

  $value = $enable ? {
    false   => 0,
    default => 1
  }

  osx_default { 'Enable feedback on volume change':
    domain => 'NSGlobalDomain',
    key    => 'com.apple.sound.beep.feedback',
    value  => $value,
    type   => 'integer'
  }
}
