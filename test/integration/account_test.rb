require File.expand_path('../../test_helper', __FILE__)

class AccountTest < Redmine::IntegrationTest
  fixtures :bios, :groups_users, :settings, :users

  def setup
    User.current = nil
  end

  def test_hook_should_fetch_expiration_date
    log_user('jsmith', 'jsmith')
    get 'my/account'
    assert_response :success
    assert_select '#user_expiration_date'
  end

end
