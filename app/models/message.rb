class Message < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :user_id, presence: true
  validates :message, presence: true, length: { minimum: 10 }

  def full_date
    "#{self.updated_at.strftime("%b %d, %Y")}"
  end
end
