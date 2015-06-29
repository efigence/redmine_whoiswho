class AddingBioHookListener < Redmine::Hook::ViewListener
  render_on :view_my_account, :partial => "my/adding_bio"
end
