class AddProducts < ActiveRecord::Migration[5.1]
  def change
  	Product.create title: 'Hawaiian', description: 'This is Hawaiian pizza', price: 350, size: 30, is_spicy: false, is_veg: false, is_best_offer: false, path_to_image: '/images/hawaiian.jpg'

  	Product.create title: 'Pepperoni', description: 'Nice Pepperoni pizza', price: 400, size: 30, is_spicy: false, is_veg: false, is_best_offer: true, path_to_image: '/images/pepperoni.jpg'

  	Product.create title: 'Vegetaran', description: 'This is Vegetaran pizza', price: 300, size: 30, is_spicy: false, is_veg: false, is_best_offer: false, path_to_image: '/images/vegetaran.jpg'
  end
end
