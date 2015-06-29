Redmine::Plugin.register :redmine_whoiswho do
  name 'Redmine Whoiswho plugin'
  author 'Maria Syczewska'
  description "This is a plugin for Redmine for implementing users' bios."
  version '0.0.1'
  url 'https://github.com/efigence/redmine_whoiswho'
  author_url 'https://github.com/efigence'
end

ActionDispatch::Callbacks.to_prepare do
  require 'redmine_whoiswho/hooks/adding_bio'
end
