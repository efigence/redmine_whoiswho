module BiosHelper

  def full_name(bio)
    return name(bio) unless bio.position
    name(bio) + ' (' + bio.position + ')'
  end

  def name(bio)
    bio.user.firstname + ' ' + bio.user.lastname
  end

  def sorted(bios)
    Bio.all.sort_by { |bio| bio.user.lastname }
  end

end
