5.times do
    Datainsert.create({
        title: Faker::Book.title,
        body: Faker::Lorem.sentence

    })
end