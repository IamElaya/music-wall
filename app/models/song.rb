class Song < ActiveRecord::Base

  validates :title, presence: true, length: { maximum: 40 }
  validates :url, presence: true, allow_blank: true, length: { maximum: 140 }
  validates :author, presence: true, length: { maximum: 25 }

end