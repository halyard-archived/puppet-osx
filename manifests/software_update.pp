# Public: Install updates from Apple
class osx::software_update {
  $update_msg = 'Software Update found the following'

  exec { 'OSX Software Update':
      command => 'softwareupdate -i -a',
      timeout => 0,
      user    => 'root',
      onlyif  => "softwareupdate -l --no-scan | grep '${update_msg}'"
  }
}
