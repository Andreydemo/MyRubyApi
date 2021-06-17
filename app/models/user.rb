class User < ApplicationRecord
  validates :firstName, presence: true
  validates :lastName, presence: true
  validates :email, presence: true
  validates :age, presence: true
  validates :password, presence: true
end
