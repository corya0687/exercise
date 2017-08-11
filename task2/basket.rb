class Basket < ApplicationRecord
  has_many :apples

  scope :zero_apples, -> { includes(:apples).where(apples: { basket_id: nil }) }
  scope :below_capacity, -> { joins(:apples).group('baskets.id').having('count(basket_id) < 27') }
  scope :common_type_with_space, ->(variety) { includes(:apples).where(apples: { variety: variety }).below_capacity }


  def self.get_basket_with_space(variety, quantity)
    if (basket = common_type_with_space(variety).below_capacity.first)
    elsif (basket = zero_apples.first)
    else
      puts "All baskets are full. We couldn't find the place for [#{quantity}] apples"
      return
    end
    basket
  end
end
