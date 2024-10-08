require 'open-uri'

# Destroy existing records
puts "Destroying all existing records..."
User.destroy_all
Host.destroy_all
Flatmate.destroy_all
Like.destroy_all
Match.destroy_all

puts "Creating Phase-1 Seeds 🌱"

# Helper methods
def random_date(from: 18.years.ago, to: 50.years.ago)
  rand(from..to)
end

def random_phone
  "+49#{rand(1000000000..9999999999)}"
end

# Create Hosts
josephine = User.find_or_create_by!(email: "josephine@roomme.com") do |user|
  user.password = "123456"
  user.role = 1
end

josephine_host = Host.find_or_create_by!(user: josephine) do |host|
  host.city = "Berlin"
  host.first_name = "Josephine"
  host.last_name = "Müller"
  host.date_of_birth = random_date
  host.gender = 1
  host.pronouns = "She/Her"
  host.email_address = "josephine@roomme.com"
  host.phone_number = random_phone
  host.district = "Mitte"
  host.rent = 1200
  host.duration = 12
  host.entry_date = Date.today + 1.month
  host.registration = 1
  host.room_size = 20
  host.furnished = 1
  host.latitude = 52.5200
  host.longitude = 13.4050
  host.profile_picture_url = "https://image.stern.de/33321512/t/Jx/v2/w1440/r1.7778/-/papst-franziskus-im-mantel.jpg"
  host.apartment_picture_urls = [
    "https://plus.unsplash.com/premium_photo-1661878091792-2d5511d508e9?q=80&w=2796&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1501127122-f385ca6ddd9d?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZmxhdCUyMGludGVyaW9yJTIwbmV3JTIweW9ya3xlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1532952626554-d0cace1cd3fc?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGZsYXQlMjBpbnRlcmlvciUyMG5ldyUyMHlvcmt8ZW58MHx8MHx8fDA%3D"
  ]
end

mustapha = User.find_or_create_by!(email: "mustapha@roomme.com") do |user|
  user.password = "123456"
  user.role = 1
end

mustapha_host = Host.find_or_create_by!(user: mustapha) do |host|
  host.city = "Berlin"
  host.first_name = "Mustapha"
  host.last_name = "Ali"
  host.date_of_birth = random_date
  host.gender = 2
  host.pronouns = "He/Him"
  host.email_address = "mustapha@roomme.com"
  host.phone_number = random_phone
  host.district = "Kreuzberg"
  host.rent = 1000
  host.duration = 6
  host.entry_date = Date.today + 2.months
  host.registration = 0
  host.room_size = 18
  host.furnished = 0
  host.latitude = 52.4967
  host.longitude = 13.4015
  host.profile_picture_url = "https://image.stern.de/33321512/t/Jx/v2/w1440/r1.7778/-/papst-franziskus-im-mantel.jpg"
  host.apartment_picture_urls = [
    "https://plus.unsplash.com/premium_photo-1722048810826-751afbcc98c0?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGludGVyaW9yJTIwZGVzaWduJTIwc2FuJTIwZnJhbmNpc2NvfGVufDB8fDB8fHww",
    "https://images.unsplash.com/photo-1532323544230-7191fd51bc1b?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGludGVyaW9yJTIwZGVzaWduJTIwc2FuJTIwZnJhbmNpc2NvfGVufDB8fDB8fHww",
    "https://plus.unsplash.com/premium_photo-1720647024032-01a5e9740c96?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzd8fGludGVyaW9yJTIwZGVzaWduJTIwc2FuJTIwZnJhbmNpc2NvfGVufDB8fDB8fHww"
  ]
end

sascha = User.find_or_create_by!(email: "sascha@roomme.com") do |user|
  user.password = "123456"
  user.role = 1
end

sascha_host = Host.find_or_create_by!(user: sascha) do |host|
  host.city = "Berlin"
  host.first_name = "Sascha"
  host.last_name = "Klein"
  host.date_of_birth = random_date
  host.gender = 2
  host.pronouns = "He/Him"
  host.email_address = "sascha@roomme.com"
  host.phone_number = random_phone
  host.district = "Neukölln"
  host.rent = 800
  host.duration = 9
  host.entry_date = Date.today + 1.month
  host.registration = 1
  host.room_size = 16
  host.furnished = 1
  host.latitude = 52.4736
  host.longitude = 13.4461
  host.profile_picture_url = "https://image.stern.de/33321512/t/Jx/v2/w1440/r1.7778/-/papst-franziskus-im-mantel.jpg"
  host.apartment_picture_urls = [
    "https://plus.unsplash.com/premium_photo-1661962821424-25b171c8a8aa?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW50ZXJpb3IlMjBkZXNpZ24lMjBwYXJpc3xlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1505409628601-edc9af17fda6?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aW50ZXJpb3IlMjBkZXNpZ24lMjBwYXJpc3xlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1505409859467-3a796fd5798e?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aW50ZXJpb3IlMjBkZXNpZ24lMjBwYXJpc3xlbnwwfHwwfHx8MA%3D%3D"
  ]
end

justus = User.find_or_create_by!(email: "justus@roomme.com") do |user|
  user.password = "123456"
  user.role = 1
end

justus_host = Host.find_or_create_by!(user: justus) do |host|
  host.city = "Berlin"
  host.first_name = "Justus"
  host.last_name = "Fischer"
  host.date_of_birth = random_date
  host.gender = 2
  host.pronouns = "He/Him"
  host.email_address = "justus@roomme.com"
  host.phone_number = random_phone
  host.district = "Charlottenburg"
  host.rent = 1500
  host.duration = 12
  host.entry_date = Date.today + 3.months
  host.registration = 1
  host.room_size = 22
  host.furnished = 1
  host.latitude = 52.5167
  host.longitude = 13.2833
  host.profile_picture_url = "https://image.stern.de/33321512/t/Jx/v2/w1440/r1.7778/-/papst-franziskus-im-mantel.jpg"
  host.apartment_picture_urls = [
    "https://images.unsplash.com/photo-1595846723416-99a641e1231a?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjJ8fGludGVyaW9yJTIwZGVzaWduJTIwTG9uZG9ufGVufDB8fDB8fHww",
    "https://images.unsplash.com/photo-1595846519845-68e298c2edd8?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjd8fGludGVyaW9yJTIwZGVzaWduJTIwTG9uZG9ufGVufDB8fDB8fHww",
    "https://plus.unsplash.com/premium_photo-1670076515866-73822a3d610d?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzd8fGludGVyaW9yJTIwZGVzaWduJTIwTG9uZG9ufGVufDB8fDB8fHww"
  ]
end

# Create Flatmates
gavin = User.find_or_create_by!(email: "gavin@example.com") do |user|
  user.password = "123456"
  user.role = 0
end

gavin_flatmate = Flatmate.find_or_create_by!(user: gavin) do |flatmate|
  flatmate.city = "Berlin"
  flatmate.first_name = "Gavin"
  flatmate.last_name = "Smith"
  flatmate.date_of_birth = random_date
  flatmate.gender = 2
  flatmate.pronouns = "He/Him"
  flatmate.email_address = "gavin@example.com"
  flatmate.phone_number = random_phone
  flatmate.district = "Friedrichshain"
  flatmate.rent_range_min = 500
  flatmate.rent_range_max = 800
  flatmate.duration = 12
  flatmate.entry_date = Date.today + 2.months
  flatmate.registration = 1
  flatmate.room_size_min = 15
  flatmate.room_size_max = 25
  flatmate.furnished = 1
  flatmate.profile_picture_url = "https://avatars.githubusercontent.com/u/100352060?v=4"
end

frida = User.find_or_create_by!(email: "frida@example.com") do |user|
  user.password = "123456"
  user.role = 0
end

frida_flatmate = Flatmate.find_or_create_by!(user: frida) do |flatmate|
  flatmate.city = "Berlin"
  flatmate.first_name = "Frida"
  flatmate.last_name = "Klein"
  flatmate.date_of_birth = random_date
  flatmate.gender = 1
  flatmate.pronouns = "She/Her"
  flatmate.email_address = "frida@example.com"
  flatmate.phone_number = random_phone
  flatmate.district = "Prenzlauer Berg"
  flatmate.rent_range_min = 600
  flatmate.rent_range_max = 900
  flatmate.duration = 12
  flatmate.entry_date = Date.today + 3.months
  flatmate.registration = 1
  flatmate.room_size_min = 18
  flatmate.room_size_max = 30
  flatmate.furnished = 1
  flatmate.profile_picture_url = "https://d26jy9fbi4q9wx.cloudfront.net/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBMGtmQXc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--ded60e8e92655f26f7eb57eafb9b2c00c92ced1b/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJYW5CbkJqb0dSVlE2RTNKbGMybDZaVjkwYjE5bWFXeHNXd2hwQWNocEFjaDdCam9KWTNKdmNEb09ZWFIwWlc1MGFXOXUiLCJleHAiOm51bGwsInB1ciI6InZhcmlhdGlvbiJ9fQ==--b67d9ded4d28d0969fbb98b4c21b79257705a99a/Foto%20am%2010.02.23%20um%2011.30.jpg"
end

lounis = User.find_or_create_by!(email: "lounis@example.com") do |user|
  user.password = "123456"
  user.role = 0
end

lounis_flatmate = Flatmate.find_or_create_by!(user: lounis) do |flatmate|
  flatmate.city = "Berlin"
  flatmate.first_name = "Lounis"
  flatmate.last_name = "Ahmed"
  flatmate.date_of_birth = random_date
  flatmate.gender = 2
  flatmate.pronouns = "He/Him"
  flatmate.email_address = "lounis@example.com"
  flatmate.phone_number = random_phone
  flatmate.district = "Wedding"
  flatmate.rent_range_min = 400
  flatmate.rent_range_max = 700
  flatmate.duration = 9
  flatmate.entry_date = Date.today + 1.month
  flatmate.registration = 0
  flatmate.room_size_min = 14
  flatmate.room_size_max = 20
  flatmate.furnished = 0
  flatmate.profile_picture_url = "https://d26jy9fbi4q9wx.cloudfront.net/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBMFFtQXc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--0236355f61e702f87b2eb68365cab14c3979c2fe/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lKYW5CbFp3WTZCa1ZVT2hOeVpYTnBlbVZmZEc5ZlptbHNiRnNJYVFISWFRSElld1k2Q1dOeWIzQTZEbUYwZEdWdWRHbHZiZz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--23cdbdf9871e44adeb4d843a03b0793a5f08394b/1651224727237.jpeg"
end

florian = User.find_or_create_by!(email: "florian@example.com") do |user|
  user.password = "123456"
  user.role = 0
end

florian_flatmate = Flatmate.find_or_create_by!(user: florian) do |flatmate|
  flatmate.city = "Berlin"
  flatmate.first_name = "Florian"
  flatmate.last_name = "Schmidt"
  flatmate.date_of_birth = random_date
  flatmate.gender = 2
  flatmate.pronouns = "He/Him"
  flatmate.email_address = "florian@example.com"
  flatmate.phone_number = random_phone
  flatmate.district = "Charlottenburg"
  flatmate.rent_range_min = 600
  flatmate.rent_range_max = 1000
  flatmate.duration = 12
  flatmate.entry_date = Date.today + 2.months
  flatmate.registration = 1
  flatmate.room_size_min = 18
  flatmate.room_size_max = 26
  flatmate.furnished = 1
  flatmate.profile_picture_url = "https://d26jy9fbi4q9wx.cloudfront.net/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBMHNtQXc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--4687d2a8a4cf604310ce97ba5ce42b2eea992f1f/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJYW5CbkJqb0dSVlE2RTNKbGMybDZaVjkwYjE5bWFXeHNXd2hwQWNocEFjaDdCam9KWTNKdmNEb09ZWFIwWlc1MGFXOXUiLCJleHAiOm51bGwsInB1ciI6InZhcmlhdGlvbiJ9fQ==--b67d9ded4d28d0969fbb98b4c21b79257705a99a/DSCF7547.jpg"
end

sree = User.find_or_create_by!(email: "sree@example.com") do |user|
  user.password = "123456"
  user.role = 0
end

sree_flatmate = Flatmate.find_or_create_by!(user: sree) do |flatmate|
  flatmate.city = "Berlin"
  flatmate.first_name = "Sree"
  flatmate.last_name = "Nair"
  flatmate.date_of_birth = random_date
  flatmate.gender = 1
  flatmate.pronouns = "She/Her"
  flatmate.email_address = "sree@example.com"
  flatmate.phone_number = random_phone
  flatmate.district = "Schöneberg"
  flatmate.rent_range_min = 500
  flatmate.rent_range_max = 800
  flatmate.duration = 12
  flatmate.entry_date = Date.today + 1.month
  flatmate.registration = 1
  flatmate.room_size_min = 16
  flatmate.room_size_max = 22
  flatmate.furnished = 1
  flatmate.profile_picture_url = "https://d26jy9fbi4q9wx.cloudfront.net/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBMHNtQXc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--4687d2a8a4cf604310ce97ba5ce42b2eea992f1f/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJYW5CbkJqb0dSVlE2RTNKbGMybDZaVjkwYjE5bWFXeHNXd2hwQWNocEFjaDdCam9KWTNKdmNEb09ZWFIwWlc1MGFXOXUiLCJleHAiOm51bGwsInB1ciI6InZhcmlhdGlvbiJ9fQ==--b67d9ded4d28d0969fbb98b4c21b79257705a99a/DSCF7547.jpg"
end

julia = User.find_or_create_by!(email: "julia@example.com") do |user|
  user.password = "123456"
  user.role = 0
end

julia_flatmate = Flatmate.find_or_create_by!(user: julia) do |flatmate|
  flatmate.city = "Berlin"
  flatmate.first_name = "Julia"
  flatmate.last_name = "Meier"
  flatmate.date_of_birth = random_date
  flatmate.gender = 1
  flatmate.pronouns = "She/Her"
  flatmate.email_address = "julia@example.com"
  flatmate.phone_number = random_phone
  flatmate.district = "Pankow"
  flatmate.rent_range_min = 700
  flatmate.rent_range_max = 1100
  flatmate.duration = 12
  flatmate.entry_date = Date.today + 3.months
  flatmate.registration = 1
  flatmate.room_size_min = 20
  flatmate.room_size_max = 30
  flatmate.furnished = 1
  flatmate.profile_picture_url = "https://avatars.githubusercontent.com/u/152524036?v=4"
end

navid = User.find_or_create_by!(email: "navid@example.com") do |user|
  user.password = "123456"
  user.role = 0
end

navid_flatmate = Flatmate.find_or_create_by!(user: navid) do |flatmate|
  flatmate.city = "Berlin"
  flatmate.first_name = "Navid"
  flatmate.last_name = "Hosseini"
  flatmate.date_of_birth = random_date
  flatmate.gender = 2
  flatmate.pronouns = "He/Him"
  flatmate.email_address = "navid@example.com"
  flatmate.phone_number = random_phone
  flatmate.district = "Tempelhof"
  flatmate.rent_range_min = 400
  flatmate.rent_range_max = 600
  flatmate.duration = 6
  flatmate.entry_date = Date.today + 1.month
  flatmate.registration = 0
  flatmate.room_size_min = 14
  flatmate.room_size_max = 20
  flatmate.furnished = 0
  flatmate.profile_picture_url = "https://avatars.githubusercontent.com/u/174311751?v=4"
end

gustavo = User.find_or_create_by!(email: "gustavo@example.com") do |user|
  user.password = "123456"
  user.role = 0
end

gustavo_flatmate = Flatmate.find_or_create_by!(user: gustavo) do |flatmate|
  flatmate.city = "Berlin"
  flatmate.first_name = "Gustavo"
  flatmate.last_name = "Silva"
  flatmate.date_of_birth = random_date
  flatmate.gender = 2
  flatmate.pronouns = "He/Him"
  flatmate.email_address = "gustavo@example.com"
  flatmate.phone_number = random_phone
  flatmate.district = "Lichtenberg"
  flatmate.rent_range_min = 500
  flatmate.rent_range_max = 800
  flatmate.duration = 9
  flatmate.entry_date = Date.today + 2.months
  flatmate.registration = 1
  flatmate.room_size_min = 16
  flatmate.room_size_max = 22
  flatmate.furnished = 1
  flatmate.profile_picture_url = "https://avatars.githubusercontent.com/u/46820695?v=4"
end

# Example output of creation:
puts "#{User.count} users (#{Host.count} hosts, #{Flatmate.count} flatmates) created."
