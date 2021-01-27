class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :hot_stocks, dependent: :destroy
  has_many :positions, dependent: :destroy
  validates :nickname, presence: true
  validates :email, presence: true
  validates :category, presence: true
end

