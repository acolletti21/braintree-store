class Dog < ApplicationRecord
  def tax 
    price * 0.09
  end

  def total 
    price + tax
  end
end
