User.create!(name:  "Naoki Kishimoto",
  email: "naoki@naoki.com",
  address: "hogefuga",
  password: "hogehoge",
  password_confirmation: "hogehoge",
  admin: true
  )

  200.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    password_confirmation = "password"
    address = "hogehoge-#{n+1}"
    User.create!(name:  name,
                 email: email,
                 address: address,
                 password: password,
                 password_confirmation: password_confirmation)
  end


  Brand.create!(brand: "Nike")
  Brand.create!(brand: "Addidas")
  Brand.create!(brand: "BURBERRY")
  Brand.create!(brand: "Zara")
  Brand.create!(brand: "Poro")

  Category.create!(category: "ジャケット")
  Category.create!(category: "半袖T")
  Category.create!(category: "長袖T")
  Category.create!(category: "パーカー")
  Category.create!(category: "コート")

  Size.create!(size: "S")
  Size.create!(size: "M")
  Size.create!(size: "L")

  Color.create!(color: "RED")
  Color.create!(color: "BLUE")
  Color.create!(color: "GREEN")
  Color.create!(color: "YELLOW")
  Color.create!(color: "BLACK")
  Color.create!(color: "WHITE")
  Color.create!(color: "PURPLE")
  Color.create!(color: "PINK")
  Color.create!(color: "CAMOUFLAGE")
  Color.create!(color: "BROWN")



  200.times do |n|
    image  = "image#{n+1}"
    Image.create!(image: image)
  end


  200.times do |n|
    name  = Faker::Commerce.product_name
    brand_id =  rand(1..5)
    category_id = rand(1..5)
    color_id = rand(1..10)
    image_id = n+1
    size_id = rand(1..3)
    price = rand(1000..10000)
    Product.create!(name:  name,
                 brand_id: brand_id,
                 category_id: category_id,
                 color_id: color_id,
                 image_id: image_id,
                 size_id: size_id,
                 price: price)
  end


  200.times do |n|
    product_id = n+1
    stock = rand(1..10)
    
    Stock.create!(product_id: product_id,
                stock: stock)
  end


    Cart.create!(user_id:  1)
    Cart.create!(user_id:  2)
    Cart.create!(user_id:  3)
 
    3.times do |n|
        product_id =  rand(1..200)
        cart_id  = 1 #rand(1..100000)
        quantity = rand(1..5)
        
        CartItem.create!(product_id: product_id,
                        cart_id: cart_id,
                        quantity: quantity)
      end