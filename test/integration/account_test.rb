require File.expand_path('../../test_helper', __FILE__)

class AccountTest < Redmine::IntegrationTest
  fixtures :bios, :groups_users, :settings, :users

  def setup
    User.current = nil
  end

  def not_permitted_group_should_not_have_access_to_plugin
    log_user('jsmith', 'jsmith')
    get 'my/account'
    assert_response :success
    assert_select '#user_bio_profile', false
  end

  def permitted_group_should_have_access_to_plugin
    log_user('dlopper', 'foo')
    get bios_index_path
    assert_response 200
  end

end
