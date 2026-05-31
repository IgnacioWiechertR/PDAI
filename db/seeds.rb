ActiveJob::Base.queue_adapter = :inline
Tagging.destroy_all
ShoppingCart.destroy_all
Item.destroy_all
Business.destroy_all
User.destroy_all
Tag.destroy_all

  nombres_tags = [
    "China", "Italiana", "Japonesa", "Koreana", "Francesa", 
    "Rápida", "Hamburguesas", "Sushi", "Pizza", "Pastas", 
    "Cafetería", "Minimarket", "Verdulería", "Pastelería", "Bebidas"
  ]

  tags = {}
  nombres_tags.each do |nombre|
    tags[nombre] = Tag.create!(name: nombre)
  end

  user1 = User.create!(
    username: "ola",
    age: 20,
    comuna: "vitacura",
    email: "ola@ola.com",
    password: "olaola",
    tags: [tags["Pizza"], tags["Hamburguesas"]]
  )

  business1 = Business.create!(
    username: "Cesar el grande",
    comuna: "vitacura",
    email: "inc@inc.com",
    password: "incinc",
    horario_inicio: 9,
    horario_termino: 18,
    tags: [tags["Italiana"], tags["Pizza"], tags["Rápida"]]
  )


  business_sushi = Business.create!(
    username: "sakura_sushi",
    comuna: "las condes",
    email: "contacto@sakurasushi.com",
    password: "password123",
    horario_inicio: 12,
    horario_termino: 23,
    tags: [tags["Japonesa"], tags["Sushi"]]
  )


  business_cafe = Business.create!(
    username: "cafe_central",
    comuna: "providencia",
    email: "hola@cafecentral.com",
    password: "password123",
    horario_inicio: 8,
    horario_termino: 20,
    tags: [tags["Cafetería"], tags["Pastelería"], tags["Bebidas"]]
  )

  # =========================================================================
  # 5. CREACIÓN DE ITEMS (Productos Regulares y Deals con Descuento/Stock)
  # =========================================================================

  # --- Productos del Negocio 1 (Cesar el grande) ---
  Item.create!(
    photo: nil, 
    name: "Pizza con pepperonni",
    description: "Queso, tomate y pepperonni",
    cost: 100,
    owner: business1,
    deal: false,
    discount_percentage: nil,
    stock: nil,
    tags: [tags["Pizza"], tags["Italiana"], tags["Rápida"]]
  )

  Item.create!(
    photo: nil,
    name: "Lata de bebida",
    description: "Lata de 350ml",
    cost: 50,
    owner: business1,
    deal: false,
    discount_percentage: nil,
    stock: nil,
    tags: [tags["Bebidas"]]
  )

  # 🔥 DEAL Exclusivo para Cesar el grande (50% de Descuento y 10 unidades)
  Item.create!(
    photo: nil,
    name: "¡DEAL FLASH! Promo Pizza Familiar Pepperoni",
    description: "Solo por hoy antes del cierre: ¡Llévate la clásica pepperoni a mitad de precio!",
    cost: 180,
    owner: business1,
    deal: true,
    discount_percentage: 50,
    stock: 10,
    tags: [tags["Pizza"], tags["Italiana"]]
  )

  # --- Productos del Sushi (sakura_sushi) ---
  Item.create!(
    photo: nil,
    name: "California Roll",
    description: "Kanikama, palta y sésamo (8 cortes)",
    cost: 120,
    owner: business_sushi,
    deal: false,
    discount_percentage: nil,
    stock: nil,
    tags: [tags["Sushi"], tags["Japonesa"]]
  )

  Item.create!(
    photo: nil,
    name: "Sashimi de Salmón",
    description: "5 cortes de salmón fresco",
    cost: 150,
    owner: business_sushi,
    deal: false,
    discount_percentage: nil,
    stock: nil,
    tags: [tags["Sushi"], tags["Japonesa"]]
  )

  # 🔥 DEAL Exclusivo para sakura_sushi (30% de Descuento y 5 unidades)
  Item.create!(
    photo: nil,
    name: "¡DEAL FLASH! Combinado Sakura Expreso (16 cortes)",
    description: "Últimas unidades disponibles de rollos seleccionados por el chef.",
    cost: 200,
    owner: business_sushi,
    deal: true,
    discount_percentage: 30,
    stock: 5,
    tags: [tags["Sushi"], tags["Japonesa"]]
  )

  # --- Productos de la Cafetería (cafe_central) ---
  Item.create!(
    photo: nil,
    name: "Café Latte",
    description: "Espresso con leche texturizada",
    cost: 80,
    owner: business_cafe,
    deal: false,
    discount_percentage: nil,
    stock: nil,
    tags: [tags["Cafetería"], tags["Bebidas"]]
  )

  Item.create!(
    photo: nil,
    name: "Torta de Chocolate",
    description: "Porción de torta húmeda de chocolate",
    cost: 150,
    owner: business_cafe,
    deal: false,
    discount_percentage: nil,
    stock: nil,
    tags: [tags["Pastelería"]]
  )

  # 🔥 DEAL Exclusivo para cafe_central (20% de Descuento y 4 unidades)
  Item.create!(
    photo: nil,
    name: "¡DEAL FLASH! Tarde Dulce: Torta + Café Latte",
    description: "Evitemos el desperdicio: Últimas porciones de torta de chocolate del día con tu latte favorito.",
    cost: 210,
    owner: business_cafe,
    deal: true,
    discount_percentage: 20,
    stock: 4,
    tags: [tags["Cafetería"], tags["Pastelería"]]
  )