class osx::security::firewall (
  $enabled = 1
) {
  boxen::osx_defaults { 'Configure firewall':
    user   => 'root',
    domain => '/Library/Preferences/com.apple.alf',
    key    => 'globalstate',
    value  => $enabled,
    type   => 'integer'
  }
}
