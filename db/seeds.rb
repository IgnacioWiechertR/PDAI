ShoppingCart.destroy_all
Item.destroy_all
Business.destroy_all
User.destroy_all

user1 = User.create!(
  username: "ola",
  age: 20,
  comuna: "vitacura",
  email: "ola@ola.com",
  password: "olaola"
)

business1 = Business.create!(
  username: "inc",
  comuna: "vitacura",
  email: "inc@inc.com",
  password: "incinc",
  category: "china" 
)

item1 = Item.create!(
  photo: nil, 
  name: "Pizza con pepperonni",
  description: "Queso, tomate y pepperonni",
  categories: ["Pizza", "Italiano", "Comida Rapida"],
  cost: 100,
  owner: business1 
)


item2 = Item.create!(
  photo: nil,
  name: "Bebida",
  description: "Lata de 350ml",
  categories: ["Bestibles"],
  cost: 50,
  owner: business1 
)
