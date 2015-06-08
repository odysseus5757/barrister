class Brief < ActiveRecord::Base

  validates :user_id, :presence => true
  validates :name, :presence => true
  validates :link, :presence => true

  belongs_to :user
  has_many :favorites

end
