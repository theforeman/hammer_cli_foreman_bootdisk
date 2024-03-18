require 'rake/testtask'
require 'bundler/gem_tasks'
require 'hammer_cli/i18n/find_task'
require_relative 'lib/hammer_cli_foreman_bootdisk/version'
require_relative 'lib/hammer_cli_foreman_bootdisk/i18n'

HammerCLI::I18n::FindTask.define(HammerCLIForemanBootdisk::I18n::LocaleDomain.new, HammerCLIForemanBootdisk.version)

namespace :pkg do
  desc 'Generate package source gem'
  task generate_source: :build
end

begin
  require 'rubocop/rake_task'
rescue LoadError
  # RuboCop is optional
else
  RuboCop::RakeTask.new
  task default: [:rubocop]
end
