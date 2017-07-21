[User].each do |model|
  ActiveRecord::Base.connection.execute("TRUNCATE #{model.table_name} RESTART IDENTITY CASCADE")
end

User.create!([
  { username: "Captain",
    firstname: "Jean-Luc",
    lastname: "Picard",
    email: "jean-luc@mail.com",
    image: "https://images-na.ssl-images-amazon.com/images/M/MV5BMTc0MzU5ODQ5OF5BMl5BanBnXkFtZTYwODIwODk1._V1_UY317_CR4,0,214,317_AL_.jpg",
  },
  { username: "Commander Riker",
    firstname: "William",
    lastname: "Riker",
    email: "williamt@mail.com",
    image: "https://images-na.ssl-images-amazon.com/images/M/MV5BMTM2MDIxOTE3Nl5BMl5BanBnXkFtZTcwMDQxNjcxNw@@._V1_UX214_CR0,0,214,317_AL_.jpg"},
  { username: "Commander Data",
    firstname: "Data",
    lastname: "Android",
    email:"data@mail.com",
    image:"https://images-na.ssl-images-amazon.com/images/M/MV5BMjAxMzA3MDIwNl5BMl5BanBnXkFtZTgwMjMyNjM5NzE@._V1_UY317_CR22,0,214,317_AL_.jpg" }
])
