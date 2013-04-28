# the price must always be in cents

class Rule
  def apply(items)
    raise NoMethodError, "you should define the apply method"
  end
end

class FruitTea < Rule
  def apply(items)
    items.reduce(0) do |quantity, item|
      if item.code == 'FR' and (quantity += 1) == 2
        quantity = item.price = 0
      end
      quantity
    end
    items
  end
end

class Strawberry < Rule
  QUANTITY = 3
  PRICE = 450
  
  def apply(items)
    if items.count{ |item| item.code == 'SR' } >= QUANTITY
      items.each{ |item| item.price = PRICE if item.code == 'SR' }
    end
    items
  end
end

class Checkout

  Item = Struct.new(:code, :price)

  PRICES = {
    'FR' => 311,
    'SR' => 500,
    'CF' => 1123
  }

  def initialize(*rules)
    @rules, @items = rules, []
  end

  def scan(name)
    @items << Item.new(name, PRICES[name])
  end

  def total
    @rules.reduce(@items.dup){ |items, rule| rule.apply(items) }.
      map(&:price).inject(:+) / 100.0
  end
end



