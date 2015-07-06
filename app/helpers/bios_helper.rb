module BiosHelper

  def full_name(bio)
    bio.user.firstname + ' ' + bio.user.lastname
  end

  def showing_user_groups(bio)
    bio.user.groups.pluck(:lastname).sort.join(", ")
  end

  def showing_user_mails(bio)
    bio.user.mails.join(", ")
  end

  def show_non_empty_fields(label, value)
    (content_tag(:p, "<strong>#{label}: </strong>#{value}".html_safe)) unless value.blank?
  end

  def empty_bio?(bio)
    !(bio.profile || bio.position || bio.user.groups)
  end

end
