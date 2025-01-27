def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  index = 0

  while index < collection.length do
    if collection[index][:item] == name
      return collection[index]
    end
    index += 1
  end
  nil
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  output = []
  index = 0

  while index < cart.length do
    if output.length == 0
      output << cart[index]
      output[-1][:count] = 1
    elsif find_item_by_name_in_collection(cart[index][:item], output) == nil
      output << cart[index]
      output[-1][:count] = 1
    else
      itemhold = find_item_by_name_in_collection(cart[index][:item], output)
      index2 = 0

      while index2 < output.length do
        if itemhold[:item] == output[index2][:item]
          output[index2][:count] += 1
        end
        index2 += 1
      end
    end
    index += 1
  end
output
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  cartIndex = 0

  while cartIndex < cart.length do
    couponIndex = 0
    while couponIndex < coupons.length do
      if cart[cartIndex][:item] == coupons[couponIndex][:item] && cart[cartIndex][:count] >= coupons[couponIndex][:num]
        cart << {
          item: cart[cartIndex][:item] + " W/COUPON",
          price: coupons[couponIndex][:cost] / coupons[couponIndex][:num],
          clearance: cart[cartIndex][:clearance],
          count: coupons[couponIndex][:num] * (cart[cartIndex][:count] / coupons[couponIndex][:num])
        }
        cart[cartIndex][:count] -= coupons[couponIndex][:num]
      end
      couponIndex += 1
    end
    cartIndex += 1
  end
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  index = 0

  while index < cart.length do
    if cart[index][:clearance] == true
      cart[index][:price] -= cart[index][:price] * 0.2
      cart[index][:price].round(2)
    end
    index += 1
  end

  cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
  cart = consolidate_cart(cart)
  cart = apply_coupons(cart, coupons)
  cart = apply_clearance(cart)
  index = 0
  total = 0

  while index < cart.length do
    total += cart[index][:price] * cart[index][:count]
    index += 1
  end

  if total > 100
    total -= total * 0.1
  end
  total
end
