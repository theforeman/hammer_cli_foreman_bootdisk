# -*- encoding: utf-8 -*-
$:.unshift File.expand_path("../lib", __FILE__)
require "hammer_cli_foreman_bootdisk/version"

Gem::Specification.new do |s|

  s.name          = "hammer_cli_foreman_bootdisk"
  s.version       = HammerCLIForemanBootdisk.version.dup
  s.platform      = Gem::Platform::RUBY
  s.authors       = ["Dominic Cleal"]
  s.email         = "dcleal@redhat.com"
  s.homepage      = "https://github.com/theforeman/hammer_cli_foreman_bootdisk"
  s.license       = "GPL-3.0-or-later"

  s.summary       = %q{Foreman boot disk commands for Hammer}
  s.description   = %q{Foreman boot disk commands for Hammer CLI}

  s.files            = Dir['{config,lib,locale}/**/*', 'LICENSE', 'README*']
  s.extra_rdoc_files = Dir['LICENSE', 'README*']
  s.require_paths = ["lib"]

  s.add_dependency 'hammer_cli_foreman', '>= 0.1.2'

end
