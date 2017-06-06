class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_dogs
  has_many :dogs, through: :carted_dog


  def calculate_totals
    subtotal = 0

    carted_dogs.each do |carted_dog|
      subtotal += carted_dog.subtotal
    end

    tax = subtotal * 0.09
    total = subtotal + tax
    update(subtotal: subtotal, tax: tax, total: total)
  end
end
