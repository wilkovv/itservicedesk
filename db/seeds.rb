# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
users = User.create(
    email: 'jan.kowalski@example.com',
    password: 'password',
    password_confirmation: 'password',
    name: 'Jan',
    surname: 'Kowalski'
  )
users = User.create(
email: 'jan.dzban@example.com',
password: 'password',
password_confirmation: 'password',
name: 'Jan',
surname: 'Dzban'
)
users = User.create(
    email: 'mojciech.milczek@google.zip',
    password: 'password',
    password_confirmation: 'password',
    name: 'Mojciech',
    surname: 'Milczek'
    )
users = User.create(
    email: 'warol.kolski@example.com',
    password: 'password',
    password_confirmation: 'password',
    name: 'Warol',
    surname: 'Kolski'
    )
servicemen = Serviceman.create(
    email: 'wojciech.wilczek@example.com',
    password: 'password',
    password_confirmation: 'password',
    name: 'Wojciech',
    surname: 'Wilczek',
    category: 'Hardware'
    )
servicemen = Serviceman.create(
    email: 'michau.dudek@example.com',
    password: 'password',
    password_confirmation: 'password',
    name: 'Michau',
    surname: 'Dudek',
    category: 'Software'
    )