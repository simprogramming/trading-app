class Document < ApplicationRecord
  validates :category, presence: true
  validates :title, presence: true
  validates :content, presence: true
end
