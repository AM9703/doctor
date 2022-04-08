class Message < ApplicationRecord
  before_create :confirm_participant
  after_create_commit { broadcast_append_to self.room }
  belongs_to :room
  belongs_to :user

  def confirm_participant
    if self.room.is_private
      is_participant = Participant.where(user_id: self.user.id, room_id: self.room.id).first
      throw :abort unless is_participant
    end
  end
end
