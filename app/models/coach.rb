class Coach < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :coach_users
         has_many :users, through: :coach_users
         has_many :messages
         validates :name, presence: true, uniqueness: true

        #  def show_last_message
        #   if (last_message = messages.last).present?
        #     if last_message.content?
        #       last_message.content
        #     else
        #       '画像が投稿されています'
        #     end
        #   else
        #     'まだメッセージはありません。'
        #   end
        # end
end
