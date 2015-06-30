class Bio < ActiveRecord::Base
  unloadable

  include Redmine::SafeAttributes

  belongs_to :user
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }

  safe_attributes 'user_id',
    'room',
    'phone',
    'mobile_phone',
    'profile',
    'images_attributes: [:image]'

end
