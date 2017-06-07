class User < ApplicationRecord
  has_secure_password
  has_many :orders
  has_many :carted_dogs

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: {with: /\w{2,}\@\w+\.\w{2,3}/, message: "please enter a valid email"  }

  def cart
    carted_dogs.where(status: 'carted')
  end

  def cart_total
    total = 0
    cart.each do |dog|
      total += dog.quantity
    end
    total * 20
  end
end
