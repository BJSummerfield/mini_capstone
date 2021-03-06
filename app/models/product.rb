class Product < ApplicationRecord
  belongs_to :supplier

  has_many :category_products
  has_many :categories, through: :category_products
  has_many :image_url
  has_many :carted_products

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: {greater_than: 0}
  validates :description, length: {in: 5..500}
  validates :description, presence: true
  #validates :image_url, presence: true

  def is_discounted?
    price < 10
  end

  def total
    taxes = price * 1.09
    '%.2f' % taxes
  end
end