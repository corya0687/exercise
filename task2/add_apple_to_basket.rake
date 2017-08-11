# add apple objects to baskets
task :add_apple_to_basket, %i[variety count] => [:environment] do |_t, args|
  quantity = args[:count].to_i
  basket = Basket.get_basket_with_space(args.variety, quantity)
  next if basket.nil?

  quantity.times do |i|
    break if basket.nil?
    basket.apples.create(variety: args.variety)
    basket.fill_rate = ((basket.apples.count.to_f / 27.to_f) * 100).round
    basket.save
    if basket.apples.count >= 27
      basket = Basket.get_basket_with_space(args.variety, quantity - i)
    end
  end
  next if basket.nil?
  basket.save
end
