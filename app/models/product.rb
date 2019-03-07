class Product < ApplicationRecord
  
  def is_discounted?
    price < 10
  end

  def total
    taxes = price * 1.09
    '%.2f' % taxes
  end

end
