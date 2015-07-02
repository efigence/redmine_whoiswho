Redmine::Plugin.register :redmine_whoiswho do
  name 'Redmine Whoiswho plugin'
  author 'Maria Syczewska'
  description "This is a plugin for Redmine for implementing users' bios."
  version '0.0.1'
  url 'https://github.com/efigence/redmine_whoiswho'
  author_url 'https://github.com/efigence'

  menu :top_menu,
  :bios,
  { :controller => 'bios', :action => 'index' },
  :caption => 'Bios'

  settings :default => {
    'groups' => []
    }, :partial => 'settings/redmine_whoiswho_settings'

  ActionDispatch::Callbacks.to_prepare do
      require 'redmine_whoiswho/hooks/adding_bio'
      require 'redmine_whoiswho/patches/user_patch'
      require 'redmine_whoiswho/patches/my_controller_patch'
  end

end
