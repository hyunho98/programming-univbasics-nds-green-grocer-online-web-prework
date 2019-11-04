def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  index = 0

  while index < collection.length do
    if (collection[index][:item] == name)
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
  index1 = 0

  while index1 < cart.length do

    if find_item_by_name_in_collection(cart[index1][:name], output) == nil
      output << cart[index1]
      output[-1][:count] = 1
    else
      index2 = 0
      itemholder = find_item_by_name_in_collection(cart[index1][:name], output)
      return itemholder + " " + output
        while index2 < output.length do
          if itemholder[:name] == output[index2][:name]
            output[index2][:count] += 1
          end
          index2 += 1
        end
    end
    index1 += 1
  end
  output
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
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
end
