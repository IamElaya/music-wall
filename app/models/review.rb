class Review < ActiveRecord::Base

  # enable :sessions
  belongs_to :user
  belongs_to :song



  validates :song, uniqueness: { scope: :user, message: "Can only be reviewed once" }
  # validate :voted, 

  # protected

  #   def voted?(song_id, user_id)
  #    if upvotes = Like.find_by("song_id = ? ", song_id)
  #     upvotes.user_id = user_id
  #     errors.add(:voted, "Already voted")
  #   end
  #   end

end