# Public: Sets sidebar icon size in Finder
#
# Examples
#
#   # Set size to 1
#   include osx::finder::sidebar_icon_size
#
#   # Or pick another size
#   class { 'osx::finder::sidebar_icon_size':
#     size = 3
#   }
#

class osx::finder::sidebar_icon_size (
  $size = 1
) {
  boxen::osx_defaults { 'Set sidebar icon size':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'NSTableViewDefaultSizeMode',
    value  => $size,
    type   => 'integer'
  }
}
