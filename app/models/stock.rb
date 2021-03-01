require 'csv'

class Stock < ApplicationRecord

  has_many :positions
  has_many :hot_stocks
  has_many :emas

  before_save :upcase_fields, :capitalize_fields
  validates :symbol, presence: true
  validates :symbol, uniqueness: true

  def upcase_fields
    self.symbol.upcase!
  end
  def capitalize_fields
    self.name.capitalize!
  end

  validates :name, presence: true
  validates :name, uniqueness: true


  # validates :grade, presence: true
  # validates :grade, inclusion: { in: %w[A B C D E F] }


  validates :category, presence: true
  validates :category, inclusion: { in: ['Financial', 'Technology','Real Estate', 'Telecommunication', 'Healthcare', 'Discretionary', 'Staple', 'Utilities', 'Energy', 'Basic Material', 'Industrial', 'Others'] }

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      stock = Stock.find_or_initialize_by(symbol: row["symbol"])
      stock.name = row["name"]
      stock.grade = row["grade"]
      stock.category = row["category"]
      stock.save!
    end
  end
end
