class User < ApplicationRecord
    has_many :messages, dependent: :destroy
    has_many :comments, through: :messages, dependent: :destroy

    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

    validates :username, presence: true, uniqueness: { case_sensitive: true }, length: { minimum: 6 }
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
    validates :password, presence: true, length: { minimum: 8 }
    validates :first_name, :last_name, presence: true

    # this callback will run before saving on create and update
    before_save :downcase_email

    # creating a custom instance method. self refers to the ActiveRecord object
    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    private
        def downcase_email
            self.email.downcase!
        end
end
