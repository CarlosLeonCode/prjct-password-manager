class Password < ApplicationRecord
  has_many :user_passwords, dependent: :destroy
  has_many :users, through: :user_passwords

  encrypts :password
  encrypts :username, deterministic: true

  with_options presence: true do
    validates :url
    validates :password
    validates :username
  end
end
