[User].each do |model|
  ActiveRecord::Base.connection.execute("TRUNCATE #{model.table_name} RESTART IDENTITY CASCADE")
end

users = User.create!([
  { username: "Captain",
    firstname: "Jean-Luc",
    lastname: "Picard",
    email: "jean-luc@mail.com",
    image: "https://images-na.ssl-images-amazon.com/images/M/MV5BMTc0MzU5ODQ5OF5BMl5BanBnXkFtZTYwODIwODk1._V1_UY317_CR4,0,214,317_AL_.jpg",
    password: "password",
    password_confirmation: "password"

  },
  { username: "Commander Riker",
    firstname: "William",
    lastname: "Riker",
    email: "williamt@mail.com",
    image: "https://images-na.ssl-images-amazon.com/images/M/MV5BMTM2MDIxOTE3Nl5BMl5BanBnXkFtZTcwMDQxNjcxNw@@._V1_UX214_CR0,0,214,317_AL_.jpg",
    password: "password",
    password_confirmation: "password"},
  { username: "Commander Data",
    firstname: "Data",
    lastname: "Android",
    email:"data@mail.com",
    image:"https://images-na.ssl-images-amazon.com/images/M/MV5BMjAxMzA3MDIwNl5BMl5BanBnXkFtZTgwMjMyNjM5NzE@._V1_UY317_CR22,0,214,317_AL_.jpg",
    password: "password",
    password_confirmation: "password" }
])

products = Product.create!([{
    name: "Twitter",
    category: "Social Media",
    image: "https://thetechportal.com/wp-content/uploads/2015/06/o-TWITTER-facebook.jpg",
    view_count: 0,
    user_id: users.first.id
  },
  {
    name: "iPhone",
    category: "Electronics",
    image: "http://www.hdwallpapers.in/walls/iphone_green_screen-normal5.4.jpg",
    view_count: 0,
    user_id: users.second.id
    }])

features = Feature.create!([{
    title: "Editing Videos",
    description: "I would love it if you guys at twitter allowed us to edit videos with Twitter",
    image: "",
    user_id: users.first.id,
    product_id: products.first.id

  }])

Comment
  .create!([{
  title: "I agree with Captain on this one.",
  description: "I've always wanted something like this to edit my videos before uploading them",
  user_id: users.second.id,
  feature_id: features.first.id
  },
  {
  title: "I know what you mean.",
  description: "I would like this feature as well.",
  user_id: users.third.id,
  feature_id: features.first.id
  },
  {
  title: "Replying to your comment.",
  description: "I'm glad your agree lol",
  user_id: users.second.id,
  feature_id: features.first.id
  },
  {
  title: "Cheers.",
  description: "Let's see if twitter take our feedback",
  user_id: users.first.id,
  feature_id: features.first.id
  }])
