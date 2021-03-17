class Group < ApplicationRecord
  has_one_attached :bull
  has_one_attached :bear
end
