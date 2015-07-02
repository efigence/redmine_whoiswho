class Bio < ActiveRecord::Base
  include Redmine::SafeAttributes
  unloadable

  belongs_to :user

  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200", icon: "32x32" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  attr_protected :user_id
  safe_attributes 'room', 'phone', 'mobile_phone', 'profile', 'position', 'image'

  scope :like, lambda {|q|
    q = q.to_s
    if q.blank?
      where({})
    else
      pattern = "%#{q}%"
      sql = %w(position room).map {|column| "LOWER(bios.#{column}) LIKE LOWER(:p)"}.join(" OR ")
      users = %w(firstname lastname).map {|column| "LOWER(users.#{column}) LIKE LOWER(:p)"}.join(" OR ")
      sql << " OR #{users}"
      # groups = "LOWER(groups.lastname) LIKE LOWER(:p)"
      # sql << " OR #{groups}"
      params = {:p => pattern}
      if q =~ /^(.+)\s+(.+)$/
        a, b = "#{$1}%", "#{$2}%"
        sql << " OR (LOWER(users.firstname) LIKE LOWER(:a) AND LOWER(users.lastname) LIKE LOWER(:b))"
        sql << " OR (LOWER(users.firstname) LIKE LOWER(:b) AND LOWER(users.lastname) LIKE LOWER(:a))"
        params.merge!(:a => a, :b => b)
      end
      where(sql, params)
    end
  }

end
