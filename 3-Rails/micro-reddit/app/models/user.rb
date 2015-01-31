class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  validates :firstname, presence: true
  validates :lastname, presence: true

end
