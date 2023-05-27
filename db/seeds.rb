# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require "active_storage"
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
servicemen = Serviceman.create(
    email: 'janusz.grunwaldzki@example.com',
    password: 'password',
    password_confirmation: 'password',
    name: 'Janusz',
    surname: 'Grunwaldzki',
    category: 'Hardware'
    )
issues = Issue.create(
    serviceman_id: 1,
    user_id: 1,
    description: "CPU is running way to hot, idling at about 70 degrees. Any kind of workload instantly triggers overheating protections and shuts down computer.",
    category: "Hardware",
    service_comment: "",
    status_string: "New",
    title: "Overheating CPU",
)
issues.photo.attach(io: File.open(Rails.root.join("app/assets/images/issue-1.png")), filename: "issue-1.png")

issues = Issue.create(
    serviceman_id: 2,
    user_id: 3,
    description: "My computer is massively slowing down when I start my browser",
    category: "Software",
    service_comment: "Won't fix, working as intended",
    status_string: "Closed",
    title: "Slow PC"
)
issues.photo.attach(io: File.open(Rails.root.join("app/assets/images/issue-3.png")), filename: "issue-2.png")

issues = Issue.create(
    serviceman_id: 3,
    user_id: 2,
    description: "As per attached photo my main monitor screen is broken please fix asap.",
    category: "Hardware",
    service_comment: "Monitor to be replaced next month",
    status_string: "In progress",
    title: "Artifacts on screen"
)
issues.photo.attach(io: File.open(Rails.root.join("app/assets/images/issue-2.png")), filename: "issue-3.png")

issues = Issue.create(
    serviceman_id: 1,
    user_id: 3,
    description: "Front panel usb ports are not working correctly, more specifically - not working at all",
    category: "Hardware",
    service_comment: "Internal USB connector got disconnected",
    status_string: "Done",
    title: "Broken USB port"
)
