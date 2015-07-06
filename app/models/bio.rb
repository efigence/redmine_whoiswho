class Bio < ActiveRecord::Base
  include Redmine::SafeAttributes
  unloadable

  belongs_to :user
  before_save :remove_bio_picture

  has_attached_file :image, styles: { small: "64x64",
                                                      med: "100x100",
                                                      large: "200x200",
                                                      icon: "32x32" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  attr_accessor :remove_image
  attr_protected :user_id
  safe_attributes 'room', 'phone', 'mobile_phone', 'profile', 'position', 'image'

  def remove_bio_picture
    self.image.clear if self.image_file_name != nil && self.remove_image == "1"
  end

  scope :like, lambda {|q|
    q = q.to_s.downcase

    if q.blank?
      where({})
    else
      pattern = "%#{q}%"
      sql = %w(position room).map {|column| "(bios.#{column}) LIKE (:p)"}.join(" OR ")
      users = %w(firstname lastname).map {|column| "(users.#{column}) LIKE (:p)"}.join(" OR ")
      sql << " OR #{users}"
      params = {:p => pattern}

      if q =~ /^(.+)\s+(.+)$/
        a, b = "#{$1}%", "#{$2}%"
        sql << " OR ((users.firstname) LIKE (:a) OR (users.firstname) LIKE (:b))
                     AND ((users.lastname) LIKE (:a) OR (users.lastname) LIKE (:b))"
        params.merge!(:a => a, :b => b)
      end

      where(sql, params)
    end

  }

end
