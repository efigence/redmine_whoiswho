class AddingBioHookListener < Redmine::Hook::ViewListener
  render_on :view_my_account, :partial => "my/adding_bio"
  render_on :view_users_form, :partial => "my/adding_bio"
end
