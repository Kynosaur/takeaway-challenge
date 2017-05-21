require_relative 'menu'
require_relative 'order'

class Takeaway
  attr_reader :basket, :menu

  def initialize
    @menu = Menu.new
    @basket = Order.new
  end

  def show_menu
    @menu.print_dishes
  end

  def add_to_order(dish, amount = 1)
    raise "Sorry, that item is not on the menu" unless @menu.dishes.has_key?(dish.to_sym)
    @basket.add(dish.to_sym, amount)
    "#{amount}x #{dish} successfully added to your order"
  end

  def basket_summary
    @basket.summary
  end

  def total
    @basket.calculate_total
  end

  def checkout(amount)
    raise "Sorry, that amount does not match your order total, please try again" unless @basket.try_complete(amount)
    "Order placed - please see your mobile for delivery details"
  end
end
