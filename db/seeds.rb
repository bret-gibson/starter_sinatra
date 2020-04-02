Customer.destroy_all
Restaurant.destroy_all
Reservation.destroy_all

john = Customer.create(name: "John Doe")
jane = Customer.create(name: "Jane Doe")

restaurant1 = Restaurant.create(name: "Artie's", cuisine: "French and Italian")
restaurant2 = Restaurant.create(name: "Sweetwater Tavern", cuisine: "American")

valentines = Reservation.create(customer_id: john.id, restaurant_id: restaurant1.id, date: "04/02/2020")
happyhour = Reservation.create(customer_id: jane.id, restaurant_id: restaurant2.id, date: "03/12/2020")
