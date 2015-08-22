# Public: Disables Smart quotes and dashes
class osx::global::disable_smart_quotes {
  boxen::osx_defaults { 'Disable smart quotes':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'NSAutomaticQuoteSubstitutionEnabled',
    value  => false,
    user   => $::boxen_user;
  }

  boxen::osx_defaults { 'Disable smart dashes':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'NSAutomaticDashSubstitutionEnabled',
    value  => false,
    user   => $::boxen_user;
  }
}
