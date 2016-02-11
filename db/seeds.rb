Company.delete_all
Company.create(name: "cannabuyer", email: "buyer.com", address: "in the clouds", city: "SF", state: "CA", zipcode: "94132")
Company.create(name: "cannaseller", email: "seller.com", address: "Hamboldtbuddy", city: "Hamboldt", state: "CA", zipcode: "95002")

# assume Company.last made all the products
Product.delete_all
seller = Company.last
seller.products.build(name: "bhoulder", description: "make oil!", quantity: 5, unit_price: 10, unit_type: "unit").save

seller.products.build(name: "vapenator", description: "make clouds!", quantity: 5, unit_price: 10, unit_type: "unit").save

seller.products.build(name: "vape cartridge", description: "refils!", quantity: 200, unit_price: 10, unit_type: "mg").save

seller.products.build(name: "CBD", description: "cure cancers!", quantity: 200, unit_price: 10, unit_type: "mg").save

# users as buyer or seller on both sides
buyer = Company.first
buyer.users.build(email: "buyer@buy.com", password: "12344321", password_digest: "12344321").save

seller = Company.first
seller.users.build(email: "seller@seller.com", password: "12344321", password_digest: "12344321").save

# building an order
order = buyer.orders.build
order.order_items.new(product_id: 1, quantity: 1).save



