puppet-osx
===========

[![Puppet Forge](https://img.shields.io/puppetforge/v/halyard/osx.svg)](https://forge.puppetlabs.com/halyard/osx)
[![MIT Licensed](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://tldrlegal.com/license/mit-license)
[![Build Status](https://img.shields.io/travis/com/halyard/puppet-osx.svg)](https://travis-ci.com/halyard/puppet-osx)

Provides classes for setting various defaults in Mac OS X.

## Changes from upstream

* Removed a lot of meta-stuff I wasn't using, like the cardboard scripts
* Set up CircleCI build tests
* Add a better osx\_default type for handling dicts
* Add `osx::finder::default_path` to set default finder window path
* Add `osx::finder::sidebar_icon_size` to set finder sidebar icons
* add `osx::finder::view_style` to handle default view
* add `osx::global::clock_format`
* add `osx::global::disable_smart_quotes`
* add `osx::global::scroll_behavior`
* add `osx::global::time_machine_prompts`
* add `osx::global::ui_mode`
* add `osx::keyboard::dim_backlight`
* add `osx::mouse::trackpad_speed`
* add `osx::screensaver::set`
* add `osx::screensaver::start_delay`
* add `osx::security::firewall`
* add `osx::software_update::frequency`
* add `osx::sound::volume_change_feedback`
* renamed `osx::dock::2d` to `osx::dock::twod` for Puppet 4 compat
* add `sip_enabled` fact for checking Rootless on 10.11
* adjusted `osx::software_update` to run idempotently on every run
* add `osx::mouse::force_touch` for controlling force_touch
* add `osx::mouse::silent_trackpad` for enabling silent clicks

## Usage

### Recovery Message Usage

Displays the given message on the lock and login screens.

```puppet
osx::recovery_message { 'If this Mac is found, please call 123-456-7890': }
```

### Global Settings

* `osx::global::disable_key_press_and_hold` - disable press-and-hold for
  accented character entry
* `osx::global::enable_keyboard_control_access` - enables the keyboard for
  navigating controls in dialogs
* `osx::global::enable_standard_function_keys` - enables the F1, F2, etc.
  keys to be treated as standard function keys
* `osx::global::expand_print_dialog` - expand the print dialog by default
* `osx::global::expand_save_dialog` - expand the save dialog by default
* `osx::global::disable_remote_control_ir_receiver` - disable remote control infrared receiver
* `osx::global::disable_autocorrect` - disables spelling autocorrection
* `osx::global::tap_to_click` - enables tap to click

### Dock Settings

* `osx::dock::twod` - use the old flat dock style (renamed from 2d to match Puppet 4 rules)
* `osx::dock::autohide` - automatically hide the dock
* `osx::dock::clear_dock` - ensures the dock only contains apps that are running
* `osx::dock::disable` - disable the dock by setting a long autohide-delay
* `osx::dock::disable_dashboard` - disable the dashboard
* `osx::dock::dim_hidden_apps` - dims icons of hidden apps
* `osx::dock::hide_indicator_lights` - remove the indicator lights below running
  apps

### Finder Settings

* `osx::finder::show_external_hard_drives_on_desktop`
* `osx::finder::show_hard_drives_on_desktop`
* `osx::finder::show_mounted_servers_on_desktop`
* `osx::finder::show_removable_media_on_desktop`
* `osx::finder::show_all_on_desktop` - does all of the above
* `osx::finder::empty_trash_securely` - enable Secure Empty Trash
* `osx::finder::unhide_library` - unsets the hidden flag on ~/Library
* `osx::finder::show_hidden_files`
* `osx::finder::enable_quicklook_text_selection`
* `osx::finder::show_warning_before_emptying_trash`
* `osx::finder::show_warning_before_changing_an_extension`
* `osx::finder::show_all_filename_extensions`
* `osx::finder::no_file_extension_warnings`

### Universal Access Settings

* `osx::universal_access::ctrl_mod_zoom` - enables zoom by scrolling while
  holding Control
* `osx::universal_access::enable_scrollwheel_zoom` - enables zoom using the
  scroll wheel

### Safari Settings

* `include osx::safari::enable_developer_mode` - enables developer mode in safari

### Miscellaneous Settings

* `osx::disable_app_quarantine` - disable the downloaded app quarantine
* `osx::no_network_dsstores` - disable creation of .DS_Store files on network
  shares
* `osx::software_update` - download and install software updates
* `osx::keyboard::capslock_to_control` - remaps capslock to control on attached keyboards

### Customizable Settings

These settings can be used like one-shots or customized.

`osx::global::key_repeat_delay` - the amount of time (in ms) before a key starts
  repeating

```puppet
# Set the default value (35)
include osx::global::key_repeat_delay

# ... or set your own
class { 'osx::global::key_repeat_delay':
  delay => 10
}
```

`osx::global::key_repeat_rate` - the amount of time (in ms) before key repeat
  'presses'

```puppet
# Set the default value (0)
include osx::global::key_repeat_rate

# ... or set your own
class { 'osx::global::key_repeat_rate':
  rate => 2
}
```

`osx::global::natural_mouse_scrolling` - enable/disable 'natural' mouse scrolling. *Requires re-login for new settings to initialize.*

```puppet
# Set the default value (enabled=true)
include osx::global::natural_mouse_scrolling

# ... or set your own
class { 'osx::global::natural_mouse_scrolling':
  enabled => false
}
```


`osx::universal_access::cursor_size` - the amount the cursor will be zoomed

```puppet
# Set the default value (1.5)
include osx::universal_access::cursor_size

# ... or set your own
class { 'osx::universal_access::cursor_size':
  zoom => 2
}
```

`osx::dock::icon_size` - the size of the dock icons, in pixels

```puppet
# Set the default value (36)
include osx::dock::icon_size

# ... or set your own
class { 'osx::dock::icon_size':
  size => 36
}
```

`osx::dock::position` - the location of the dock on the screen ('right', 'left', 'top', 'bottom')

```puppet
# Set the default value ('right')
include osx::dock::position

# ... or set your own
class { 'osx::dock::position':
  position => 'right'
}
```

`osx::dock::pin_position` - the location to pin the dock to ('start', 'middle', 'end')

```puppet
# Set the default value ('start')
include osx::dock::pin_position

# ... or set your own
class { 'osx::dock::pin_position':
  position => 'start'
}
```

`osx::dock::hot_corner` - configure the action for a hot corner

```puppet
# Make the top left corner display the Dashboard
osx::dock::hot_corner { 'Top Left':
  action => 'Dashboard'
}

# Make the bottom right corner show the desktop
osx::dock::hot_corner { 'Show the desktop':
  position => 'Bottom Right',
  action => 'Desktop'
}
```

`osx::dock::hot_corners` - configure the hot corners

```puppet
# Make the top right corner start the screen saver and the bottom left corner launch Mission Control
class { 'osx::dock::hot_corners':
  top_right => "Start Screen Saver",
  bottom_left => "Mission Control"
}
```

`osx::sound::interface_sound_effects` - enable interface sound effects (true, false)

```puppet
# Set the default value (true)
include osx::sound::interface_sound_effects

# ... or set your own
class { 'osx::sound::interface_sound_effects':
  enable => false
}
```

`osx::mouse::button_mode` - the button mode for multitouch mice (1, 2) *Requires re-login for new settings to initialize.*

```puppet
# Set the default mode (1)
include osx::mouse::button_mode

# ... or set your own
class { 'osx::mouse::button_mode':
  mode => 2
}
```

`osx::mouse::smart_zoom` - enable/disable smart zoom for multitouch mice *Requires re-login for new settings to initialize.*

```puppet
# Set the default value (enabled=false)
include osx::mouse::smart_zoom

# ... or set your own
class { 'osx::mouse::smart_zoom':
  enabled => true
}
```

`osx::mouse::swipe_between_pages` - enable/disable swipe between pages for multitouch mice *Requires re-login for new settings to initialize.*

```puppet
# Set the default value (enabled=false)
include osx::mouse::swipe_between_pages

# ... or set your own
class { 'osx::mouse::swipe_between_pages':
  enabled => true
}
```

`osx::dock::magnification` - size of dock icon magnification

```puppet
# Set the default value (true, 128)
include osx::dock::magnification

# ... or set your own
class { 'osx::dock::magnification':
  magnification => true,
  magnification_size => 84
}
```

## Required Puppet Modules

* [boxen](https://github.com/halyard/puppet-boxen)

