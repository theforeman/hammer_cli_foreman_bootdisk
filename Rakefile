require 'rake/testtask'
require 'bundler/gem_tasks'
require 'hammer_cli/i18n/find_task'
require_relative "./lib/hammer_cli_foreman_bootdisk/version"
require_relative "./lib/hammer_cli_foreman_bootdisk/i18n"
require 'ci/reporter/rake/minitest'

HammerCLI::I18n::FindTask.define(HammerCLIForemanBootdisk::I18n::LocaleDomain.new, HammerCLIForemanBootdisk.version)


Rake::TestTask.new do |t|
  t.libs.push 'lib'
  t.test_files = Dir.glob('test/**/*_test.rb')
  t.verbose = true
  t.warning = ENV.key?('RUBY_WARNINGS')
end

task :default => :test

namespace :pkg do
  desc 'Generate package source gem'
  task :generate_source => :build
end
