module BiosHelper

  def full_name(bio)
    bio.user.firstname + ' ' + bio.user.lastname
  end

  def showing_user_groups(bio)
    bio.user.groups.map(&:lastname).sort.join(", ")
  end

  def showing_user_mails(bio)
    bio.user.mails.join(", ")
  end

  def show_non_empty_fields(label, value)
    (content_tag(:strong, "#{label}: ") + content_tag(:p, "#{value}")) unless value.blank?
  end

end
