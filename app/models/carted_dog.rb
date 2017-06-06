class CartedDog < ApplicationRecord
  belongs_to :user
  belongs_to :dog
  belongs_to :order, optional: true

  validates :quantity, presence: true
  validates :quantity, numericality: {only_integer: true, greater_than: 0}
  validates :status, presence: true

  def subtotal
    dog.price * quantity
  end
end
