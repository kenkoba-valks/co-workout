class Address < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :coach, optional: true
end
