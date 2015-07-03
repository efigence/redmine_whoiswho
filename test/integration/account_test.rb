require File.expand_path('../../test_helper', __FILE__)

class AccountTest < Redmine::IntegrationTest
  self.fixture_path = File.join(File.dirname(__FILE__), '../fixtures')

  fixtures :users, :settings, :bios, :groups_users

  def setup
    User.current = nil
  end

  def test_not_permitted_group_should_not_see_bio_in_my_account
    log_user('jsmith', 'jsmith')
    get '/my/account'
    assert_response :success
    assert_select '#user_bio_profile', false
  end

  def test_not_permitted_group_should_not_see_bios_path
    log_user('jsmith', 'jsmith')
    get bios_path
    assert_response :success
    assert_select '#query', false
  end

  def test_permitted_group_should_edit_bio_in_my_account
    log_user('dlopper', 'foo')
    get '/my/account'
    assert_response :success
    assert_select '#user_bio_profile'

    user = User.current
    user.bio.profile = "New text"
    user.save
    assert_equal "New text", user.bio.profile

  end

  def test_permitted_group_should_see_bios_path
    log_user('dlopper', 'foo')
    get bios_path
    assert_response :success
  end

end
