class User < ActiveRecord::Base


  has_many :songs
  has_many :likes
  has_many :reviews
  # enable :sessions

  # validates :title, presence: true, length: { maximum: 40 }
  # validates :url, length: { maximum: 140 }
  # validates :author, presence: true, length: { maximum: 25 }

end