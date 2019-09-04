source "https://rubygems.org"

eval_gemfile(File.expand_path("Gemfile.common", __dir__))

group :release do
  gem 'chandler', '0.9.0' # Github releases from changelog
end

group :lint do
  # Code style
  gem 'rubocop', '0.63.1'
  gem 'rubocop-rspec', '~> 1.30'
  gem 'mdl', '0.5.0'

  # Translations
  gem 'i18n-tasks'
  gem 'i18n-spec'
end

group :docs do
  gem 'yard'     # Documentation generator
  gem 'kramdown' # Markdown implementation (for yard)
end

gem "rails", "~> 5.2.3"
gem "activerecord-jdbcsqlite3-adapter", "~> 52.0", platform: :jruby

gemspec path: "."
