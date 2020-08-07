# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# bookmarks

20.times do |c| 
    Category.create({
        name: Faker::Food.dish,
        visible: true
    })
end
var = Category.all


20.times do |x|
    ran_id = rand(1..20)
    if (x+1) == ran_id || ran_id < 20
        ran_id += 1
    else
        ran_id -= 1
    end 

    Type.create!({
        name:  Faker::Food.ingredient,
        visible: true,
        category_id: var.sample.id,
        type_id: ran_id
    })
end

types = Type.all

20.times do |b|
    Bookmark.create({
        name: Faker::Food.sushi,
        url: Faker::Internet.url,
        type: types.sample 
    })
end