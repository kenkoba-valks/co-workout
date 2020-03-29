class Coach < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :coach_users
         has_many :users, through: :coach_users
         has_many :messages
         has_one :address
         validates :name, presence: true, uniqueness: true

         def self.search(search)
          return Coach.all unless search
          Coach.where('name LIKE(?)', "%#{search}%")
        end

         def show_last_message
          if (last_message = messages.last).present?
            if last_message.content?
              last_message.content
            else
              '画像が投稿されています'
            end
          else
            'まだメッセージはありません。'
          end
        end
end

# <%= form_with(url: tweets_searches_path, local: true, method: :get, class: "search-form") do |form| %>
#   <%= form.text_field :keyword, placeholder: "投稿を検索する", class: "search-input" %>
#   <%= form.submit "検索", class: "search-btn" %>
# <% end %>
# <div class="contents row">
#   <% @tweets.each do |tweet| %>
#     <%= render partial: "tweets/tweet", locals: { tweet: tweet } %>
#   <% end %>
# </div>

# <%= form_with(url: search_tweets_path, local: true, method: :get, class: "search-form") do |form| %>
#   <%= form.text_field :keyword, placeholder: "投稿を検索する", class: "search-input" %>
#   <%= form.submit "検索", class: "search-btn" %>
# <% end %>
# <div class="contents row">
#   <% @tweets.each do |tweet| %>
#     <%= render partial: "tweet", locals: { tweet: tweet } %>
#   <% end %>
#   <%= paginate(@tweets) %>
# </div>