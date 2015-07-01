module BiosHelper

  def full_name(bio)
    bio.user.firstname + ' ' + bio.user.lastname
  end

  def active_bios
    Bio.joins(:user).where("users.status = ?", 1)
  end

  def sorted_bios
    active_bios.sort_by { |bio| bio.user.lastname }
  end

  def showing_user_groups(bio)
    bio.user.groups.map(&:lastname).sort.join(", ")
  end

end
