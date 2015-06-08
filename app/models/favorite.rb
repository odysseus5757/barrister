class Favorite < ActiveRecord::Base

  validates :user_id, :presence => true
  validates :brief_id, :presence => true

  belongs_to :user

end
