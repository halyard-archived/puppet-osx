class osx::global::scroll_behavior (
  $mode = 1
) {
  boxen::osx_defaults { 'Jump to spot that is clicked':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'AppleScrollerPagingBehavior',
    value  => $mode,
    type   => 'integer'
  }
}
