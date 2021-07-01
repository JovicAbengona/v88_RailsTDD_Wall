class Comment < ApplicationRecord
  belongs_to :message
  belongs_to :user

  validates :message_id, presence: true
  validates :user_id, presence: true
  validates :comment, presence: true, length: { minimum: 10 }

  def full_date
    "#{self.updated_at.strftime("%b %d, %Y")}"
  end
end
