class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :coach_users
  has_many :coaches, through: :coach_users
  has_many :messages
  has_one :address

  def self.search(search)
    return User.all unless search
    User.where('text LIKE(?)', "%#{search}%")
  end

end
