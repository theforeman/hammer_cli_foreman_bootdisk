source "https://rubygems.org"

gemspec

gem 'gettext', '>= 3.1.3', '< 4.0.0'
gem 'rake', '~> 13.1.0'

# load local gemfile
['Gemfile.local.rb', 'Gemfile.local'].map do |file_name|
  local_gemfile = File.join(File.dirname(__FILE__), file_name)
  self.instance_eval(Bundler.read_file(local_gemfile)) if File.exist?(local_gemfile)
end
