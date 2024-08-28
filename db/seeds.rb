# Destroying all existing records:
User.destroy_all
Host.destroy_all
Flatmate.destroy_all
Like.destroy_all
Match.destroy_all

# Phase 1 Seeds: In order to streamlinethe process of creating likes, matches, messages
puts "Creating Phase-1 Seeds 🌱"
# Create 12 new instances of the User
# HOSTS:
josephine = User.create!(email: "josephine@roomme.com", password: "123456",role: 1 )
josephine_host = Host.create!(user: josephine, city: "Berlin")

mustapha = User.create!(email: "mustapha@roomme.com", password: "123456",role: 1 )
Host.create!(user: mustapha, city: "Berlin")

sascha = User.create!(email: "sascha@roomme.com", password: "123456",role: 1 )
Host.create!(user: sascha, city: "Berlin")

justus = User.create!(email: "justus@roomme.com", password: "123456",role: 1 )
Host.create!(user: justus, city: "Berlin")

#FLATMATES:
gavin = User.create!(email: "gavin@example.com", password: "123456", role: 0)
Flatmate.create!(user: gavin, city: "Berlin")

frida = User.create!(email: "frida@example.com", password: "123456", role: 0)
frida_flatmate = Flatmate.create!(user: frida, city: "Berlin")

lounis = User.create!(email: "lounis@example.com", password: "123456", role: 0)
Flatmate.create!(user: lounis, city: "Berlin")

florian = User.create!(email: "florian@example.com", password: "123456", role: 0)
Flatmate.create!(user: florian, city: "Berlin")

sree = User.create!(email: "sree@example.com", password: "123456", role: 0)
Flatmate.create!(user: sree, city: "Berlin")

julia = User.create!(email: "julia@example.com", password: "123456", role: 0)
Flatmate.create!(user: julia, city: "Berlin" )

navid = User.create!(email: "navid@example.com", password: "123456", role: 0)
Flatmate.create!(user: navid, city: "Berlin")

gustavo = User.create!(email: "gustavo@example.com", password: "123456", role: 0)
Flatmate.create!(user: gustavo, city: "Berlin")
#host profile

# SAMPLE 5 LIKES FOR DEVELOPMENT

Like.create!(liker: josephine, liked: frida)
Like.create!(liker: mustapha, liked: navid)
Like.create!(liker: justus, liked: gustavo)
Like.create!(liker: frida, liked: josephine)
Like.create!(liker: gustavo, liked: sascha)

# Create one sample match
Match.create!(flatmate: frida_flatmate, host: josephine_host)
puts "#{User.count} users (#{Host.count} hosts, #{Flatmate.count} flatmates), #{Like.count} likes, and #{Match.count} matches created."
