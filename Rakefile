require 'bundler/gem_tasks'

namespace :gettext do
  desc "Update pot file"
  task :setup do
    require "hammer_cli_foreman_bootdisk/version"
    require "hammer_cli_foreman_bootdisk/i18n"
    require 'gettext/tools/task'

    domain = HammerCLIForemanBootdisk::I18n::LocaleDomain.new
    GetText::Tools::Task.define do |task|
      task.package_name = domain.domain_name
      task.package_version = HammerCLIForemanBootdisk.version.to_s
      task.domain = domain.domain_name
      task.mo_base_directory = domain.locale_dir
      task.po_base_directory = domain.locale_dir
      task.files = domain.translated_files
    end
  end

  desc "Update pot file"
  task :find => [:setup] do
    Rake::Task["gettext:po:update"].invoke
  end

end

namespace :pkg do
  desc 'Generate package source gem'
  task :generate_source => :build
end
