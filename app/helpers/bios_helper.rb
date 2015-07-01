module BiosHelper

  def full_name_with_position(bio)
    return full_name(bio) unless bio.position
    full_name(bio) + ' (' + bio.position + ')'
  end

  def full_name(bio)
    bio.user.firstname + ' ' + bio.user.lastname
  end

  def sorted(bios)
    Bio.all.sort_by { |bio| bio.user.lastname }
  end

  def showing_user_groups(bio)
    bio.user.groups.map(&:lastname).sort.join(", ")
  end

end
