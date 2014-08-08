module HammerCLIForemanBootdisk
  class Bootdisk < HammerCLIForeman::Command
    resource :disks

    class GenericCommand < HammerCLIForemanBootdisk::DownloadCommand
      action :generic

      command_name    'generic'
      success_message _('Successfully downloaded generic disk image to %s')
      failure_message _('Failed to download generic disk image')

      build_options
    end

    class HostCommand < HammerCLIForemanBootdisk::DownloadCommand
      action :host

      command_name    'host'
      success_message _('Successfully downloaded host disk image to %s')
      failure_message _('Failed to download host disk image')

      build_options
    end

    autoload_subcommands
  end
end
