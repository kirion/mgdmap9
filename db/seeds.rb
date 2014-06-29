# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: 'kirion', email: 'ysergeev@gmail.com', phone: '+79161104301', password: '12345678', password_confirmation: '12345678')
Person.create(name: 'Дмитрий', surname: 'Иванов', fathername: 'Александрович', type: 'Волонтер', house_head: 0, address: 'Астрадамская ул., 7б', city: "Москва", country: 'Россия')
Person.create(name: 'Сергей', surname: 'Петров', fathername: 'Александрович', type: 'Сторонник', house_head: 1, address: 'Дмитровское шоссе, 13 корп 4', city: "Москва", country: 'Россия')
#House.create(name: 'Астрадамская ул., 7б', address: 'Астрадамская ул., 7б', city: "Москва", country: 'Россия', n_porches: 4, n_floors: 5, n_flats: 80, n_occupants: 0, key: 0)
#House.create(name: 'Дмитровское шоссе, 13 корп 4', address: 'Дмитровское шоссе, 13 корп 4', city: "Москва", country: 'Россия', n_porches: 4, n_floors: 5, n_flats: 80, n_occupants: 0, key: 0)
#House.create(name: 'Дубки ул., 4', address: 'Дубки ул., 4', city: "Москва", country: 'Россия', n_porches: 1, n_floors: 9, n_flats: 126, n_occupants: 0, key: 0)

