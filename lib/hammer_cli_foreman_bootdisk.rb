require 'hammer_cli_foreman'

module HammerCLIForemanBootdisk
  def self.exception_handler_class
    HammerCLIForeman::ExceptionHandler
  end

  begin
    require 'hammer_cli_foreman_bootdisk/commands'
    require 'hammer_cli_foreman_bootdisk/version'

    HammerCLI::MainCommand.lazy_subcommand('bootdisk', _("Download boot disks"),
                                           'HammerCLIForemanBootdisk::Bootdisk', 'hammer_cli_foreman_bootdisk/bootdisk')
  rescue StandardError => e
    handler = HammerCLIForeman::ExceptionHandler.new(context: {}, adapter: :base)
    handler.handle_exception(e)
    raise HammerCLI::ModuleLoadingError, e
  end
end
