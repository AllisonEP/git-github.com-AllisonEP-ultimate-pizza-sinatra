user = User.first

user.pizza_parlours.create(name: "Rubirosa", description: "Thin, NY Style")
user.pizza_parlours.create(name: "Pizza Loves Emily", description: "Detroit Style")
user.pizza_parlours.create(name: "Keste", description: "Italian Style")