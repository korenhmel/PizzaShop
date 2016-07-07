class AddProducts < ActiveRecord::Migration
  def change
    Product.create title: 'Hawaiian', description: 'This is Hawaiian pizza', price: 80, size:  30, is_spicy: false, is_veg:   false, is_best_offer: false, path_to_image: '/images/hawaiian.png'


    Product.create title: 'Papperony', description: 'Nice Papperony pizza',price: 100, size:  30, is_spicy: true, is_veg:   false, is_best_offer: true, path_to_image: '/images/papperony.jpeg'

    Product.create title: 'Vegeterian', description: 'Amazing Vegeterian pizza', price: 80, size:  30, is_spicy: false, is_veg:   true, is_best_offer: false, path_to_image: '/images/veget.png'
  end
end
