# frozen_string_literal: true

source 'https://rubygems.org'

gemspec

gem 'gettext', '>= 3.1.3', '< 4.0.0'
gem 'rake', '~> 13.1.0'

gem 'hammer_cli_foreman', github: 'theforeman/hammer-cli-foreman', branch: 'master'

group :test do
  gem 'rubocop', '~> 1.57.0'
  gem 'rubocop-performance', '~> 1.5.2'
end

# load local gemfile
['Gemfile.local.rb', 'Gemfile.local'].map do |file_name|
  local_gemfile = File.join(File.dirname(__FILE__), file_name)
  instance_eval(Bundler.read_file(local_gemfile)) if File.exist?(local_gemfile)
end
