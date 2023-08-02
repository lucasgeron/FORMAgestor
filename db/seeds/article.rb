100.times do
  Article.create(
    title: Faker::Book.title,
    body: Faker::Lorem.paragraph,
    cover_url: "https://source.unsplash.com/random/800x600?book"
  )
end