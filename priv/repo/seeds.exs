alias PhoenixGraphqlApi.{Post, Repo, User}

Repo.insert!(%User{username: "Ryan Swapp", email: "ryan@ryan.com"})
Repo.insert!(%User{username: "Rosie", email: "rosie@mydog.com"})

for _ <- 1..10 do
    Repo.insert!(%Post{
        title: Faker.Lorem.sentence,
        body: Faker.Lorem.paragraph,
        user_id: Enum.random(1..2)
    })
end