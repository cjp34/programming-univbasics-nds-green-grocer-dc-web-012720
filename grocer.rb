def find_item_by_name_in_collection(name, collection)
  i = 0
  while i < collection.length 
    if name == collection[i][:item]
      return collection[i]
  end
  i += 1
end
nil
end

def consolidate_cart(cart)
  new_cart = []
  i = 0
  while i < cart.length
    new_cart_item = find_item_by_name_in_collection(cart[i][:item], new_cart)
    if new_cart_item
      new_cart_item[:count] += 1
    else
      new_cart_item = {
        :item => cart[i][:item],
        :price => cart[i][:price],
        :clearance => cart[i][:clearance],
        :count => 1
      }
    new_cart << new_cart_item
    end
  i += 1  
  end
  return new_cart
end

def apply_coupons(cart, coupons)
  i = 0
  while i < coupons.length
  cart_item = find_item_by_name_in_collection(coupons[i][:item], cart)
  coupon_item_name = "#{coupons[i][:item]} W/COUPON"
  cart_item_with_coupon = find_item_by_name_in_collection(coupon_item_name, cart)
    if cart_item && cart_item[:count] >= coupons[i][:num]
      if cart_item_with_coupon
        cart_item_with_coupon[:count] += coupons[i][:num]
        cart_item[:count] -= coupons[i][:num]
      else
        cart_item_with_coupon = {
          :item => coupon_item_name,
          :price => coupons[i][:cost] / coupons[i][:num],
          :count => coupons[i][:num],
          :clearance => cart_item[:clearance]
        }
        cart << cart_item_with_coupon
        cart_item[:count] -= coupons[i][:num]
      end  
    end  
  i += 1
  end
  cart
end

def apply_clearance(cart)
  i = 0
  while i < cart.length
    if cart[i][:clearance]
      
    end
  i += 1
  end
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
