class Bio < ActiveRecord::Base
  unloadable

  include Redmine::SafeAttributes

  belongs_to :user
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  # validates :profile, presence: true
  # validates :phone, format: { with: /\d{3}-\d{2}-\d{2}/, message: "You should use (+48) 22 xxx xx xx format"}
  attr_protected :user_id

  safe_attributes 'room', 'phone', 'mobile_phone', 'profile', 'position', 'image'

end
