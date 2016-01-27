class Song < ActiveRecord::Base

  # enable :sessions
  belongs_to :user
  has_many :likes
  has_many :reviews

  validates :title, presence: true, length: { maximum: 40 }
  validates :url, length: { maximum: 140 }
  validates :author, presence: true, length: { maximum: 25 }

  def already_liked?(user)
    likes.any? do |like|
      like.user_id == user.id
    end
  end

  def already_reviewed?(user)
    reviews.any? do |review|
      review.user_id == user.id
    end
  end


end