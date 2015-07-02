module BiosHelper

  def full_name(bio)
    bio.user.firstname + ' ' + bio.user.lastname
  end

  def showing_user_groups(bio)
    bio.user.groups.map(&:lastname).sort.join(", ")
  end

  def preview(bio)
    link_to l(:button_preview), bio, :remote => true
  end

end
