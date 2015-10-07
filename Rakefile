require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet_blacksmith/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
require 'puppet-syntax/tasks/puppet-syntax'

PuppetLint.configuration.relative = true
PuppetLint.configuration.fail_on_warnings = true
PuppetLint.configuration.with_filename = true

desc 'Run syntax and lint checks'
task test: [
  :metadata,
  :syntax,
  :lint
]
