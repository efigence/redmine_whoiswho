class Bio < ActiveRecord::Base
  include Redmine::SafeAttributes
  unloadable

  belongs_to :user

  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  attr_protected :user_id
  safe_attributes 'room', 'phone', 'mobile_phone', 'profile', 'position', 'image'

end
