require 'tempfile'
require 'hammer_cli_foreman/commands'

module HammerCLIForemanBootdisk
  class DownloadCommand < HammerCLIForeman::Command
    option "--file", "PATH", _("File or device to write image to")
    option "--force", :flag, _("Force writing to existing destination (device etc.)")
    option "--sudo", :flag, _("Use sudo to write to device")

    def print_data(record)
      server_filename = $1 if record.headers[:content_disposition] =~ /filename=["']?([^\s,;"']+)/
      file = options[HammerCLI.option_accessor_name('file')] || server_filename || 'bootdisk.iso'
      if !options[HammerCLI.option_accessor_name('force')] && File.exist?(file) && !File.file?(file)
        raise(HammerCLIForeman::OperationNotSupportedError, _("Destination %s already exists and isn't a regular file, use '--force' if you are sure you wish to write to it") % file)
      end

      if options[HammerCLI.option_accessor_name('sudo')]
        temp_file = Tempfile.new('bootdisk')
        begin
          File.open(temp_file, 'w') { |f| f.write(record) }
          system('sudo', 'dd', "if=#{temp_file.path}", "of=#{file}", 'bs=1024')
        ensure
          temp_file.close
          temp_file.unlink
        end
      else
        File.open(file, 'w') { |f| f.write(record) }
      end
      print_message (success_message % file) if success_message
    end

    def request_options
      {:response => :raw}
    end
  end
end
