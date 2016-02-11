
Product.delete_all
Product.create(name: "bhoulder", description: "make oil!", quantity: 5, unit_type: "unit")
Product.create(name: "vapenator", description: "make clouds!", quantity: 5, unit_type: "unit")
Product.create(name: "vape cartridge", description: "refils!", quantity: 200, unit_type: "mg")
Product.create(name: "CBD", description: "cure cancers!", quantity: 200, unit_type: "mg")

Company.delete_all
Company.create(name: "cannabuyer", email: "buyer.com", address: "in the clouds", city: "SF", state: "CA", zipcode: "94132")
Company.create(name: "cannaseller", email: "seller.com", address: "Hamboldtbuddy", city: "Hamboldt", state: "CA", zipcode: "95002")
