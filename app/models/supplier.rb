class Supplier < ApplicationRecord
  has_many :products
  
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  
  # def products
  #   Product.where(supplier_id: id)
  # end
end
