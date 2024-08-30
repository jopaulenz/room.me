# Destroying all existing records
puts "Destroying all existing records..."
User.destroy_all
Host.destroy_all
Flatmate.destroy_all
Like.destroy_all
Match.destroy_all

puts "Creating Phase-1 Seeds 🌱"

# Create Hosts
josephine = User.find_or_create_by!(email: "josephine@roomme.com") do |user|
  user.password = "123456"
  user.role = 1
end
josephine_host = Host.find_or_create_by!(user: josephine, city: "Berlin") do |host|
  host.profile_picture_url = "https://d26jy9fbi4q9wx.cloudfront.net/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBM1VnQXc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--4331202c7b265b96eb4053dbe8a3118bb11e83ce/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJU2xCSEJqb0dSVlE2RTNKbGMybDZaVjkwYjE5bWFXeHNXd2hwQWNocEFjaDdCam9KWTNKdmNEb09ZWFIwWlc1MGFXOXUiLCJleHAiOm51bGwsInB1ciI6InZhcmlhdGlvbiJ9fQ==--35a77baed05205a7e10c3ee76e90ab712819a68d/944FA694-B114-4469-AC57-37F12ACEA7F4.JPG"
  host.apartment_picture_urls = [
    "https://plus.unsplash.com/premium_photo-1661878091792-2d5511d508e9?q=80&w=2796&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1501127122-f385ca6ddd9d?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZmxhdCUyMGludGVyaW9yJTIwbmV3JTIweW9ya3xlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1532952626554-d0cace1cd3fc?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGZsYXQlMjBpbnRlcmlvciUyMG5ldyUyMHlvcmt8ZW58MHx8MHx8fDA%3D"
  ]
  host.address = "Alexanderplatz, Berlin, Germany"
end

mustapha = User.find_or_create_by!(email: "mustapha@roomme.com") do |user|
  user.password = "123456"
  user.role = 1
end
Host.find_or_create_by!(user: mustapha, city: "Berlin") do |host|
  host.profile_picture_url = "https://avatars.githubusercontent.com/u/174129535?v=4"
  host.apartment_picture_urls = [
    "https://plus.unsplash.com/premium_photo-1722048810826-751afbcc98c0?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGludGVyaW9yJTIwZGVzaWduJTIwc2FuJTIwZnJhbmNpc2NvfGVufDB8fDB8fHww",
    "https://images.unsplash.com/photo-1532323544230-7191fd51bc1b?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGludGVyaW9yJTIwZGVzaWduJTIwc2FuJTIwZnJhbmNpc2NvfGVufDB8fDB8fHww",
    "https://plus.unsplash.com/premium_photo-1720647024032-01a5e9740c96?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzd8fGludGVyaW9yJTIwZGVzaWduJTIwc2FuJTIwZnJhbmNpc2NvfGVufDB8fDB8fHww"
  ]
  host.address = "Potsdamer Platz, Berlin, Germany"
end

sascha = User.find_or_create_by!(email: "sascha@roomme.com") do |user|
  user.password = "123456"
  user.role = 1
end
Host.find_or_create_by!(user: sascha, city: "Berlin") do |host|
  host.profile_picture_url = "https://avatars.githubusercontent.com/u/174243686?v=4"
  host.apartment_picture_urls = [
    "https://plus.unsplash.com/premium_photo-1661962821424-25b171c8a8aa?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW50ZXJpb3IlMjBkZXNpZ24lMjBwYXJpc3xlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1505409628601-edc9af17fda6?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aW50ZXJpb3IlMjBkZXNpZ24lMjBwYXJpc3xlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1505409859467-3a796fd5798e?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aW50ZXJpb3IlMjBkZXNpZ24lMjBwYXJpc3xlbnwwfHwwfHx8MA%3D%3D"
  ]
  host.address = "Friedrichstraße, Berlin, Germany"
end

justus = User.find_or_create_by!(email: "justus@roomme.com") do |user|
  user.password = "123456"
  user.role = 1
end
Host.find_or_create_by!(user: justus, city: "Berlin") do |host|
  host.profile_picture_url = "https://avatars.githubusercontent.com/u/174940439?v=4"
  host.apartment_picture_urls = [
    "https://images.unsplash.com/photo-1595846723416-99a641e1231a?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjJ8fGludGVyaW9yJTIwZGVzaWduJTIwTG9uZG9ufGVufDB8fDB8fHww",
    "https://images.unsplash.com/photo-1595846519845-68e298c2edd8?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjd8fGludGVyaW9yJTIwZGVzaWduJTIwTG9uZG9ufGVufDB8fDB8fHww",
    "https://plus.unsplash.com/premium_photo-1670076515866-73822a3d610d?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzd8fGludGVyaW9yJTIwZGVzaWduJTIwTG9uZG9ufGVufDB8fDB8fHww"
  ]
  host.address = "Kurfürstendamm, Berlin, Germany"
end

# Create Flatmates
gavin = User.find_or_create_by!(email: "gavin@example.com", profile_picture_url: "https://example.com/justus.jpg") do |user|
  user.password = "123456"
  user.role = 0
end
Flatmate.find_or_create_by!(user: gavin, city: "Berlin", profile_picture_url: "https://avatars.githubusercontent.com/u/100352060?v=4")

frida = User.find_or_create_by!(email: "frida@example.com") do |user|
  user.password = "123456"
  user.role = 0
end
frida_flatmate = Flatmate.find_or_create_by!(user: frida, city: "Berlin", profile_picture_url: "https://d26jy9fbi4q9wx.cloudfront.net/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBMGtmQXc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--ded60e8e92655f26f7eb57eafb9b2c00c92ced1b/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJYW5CbkJqb0dSVlE2RTNKbGMybDZaVjkwYjE5bWFXeHNXd2hwQWNocEFjaDdCam9KWTNKdmNEb09ZWFIwWlc1MGFXOXUiLCJleHAiOm51bGwsInB1ciI6InZhcmlhdGlvbiJ9fQ==--b67d9ded4d28d0969fbb98b4c21b79257705a99a/Foto%20am%2010.02.23%20um%2011.30.jpg")

lounis = User.find_or_create_by!(email: "lounis@example.com") do |user|
  user.password = "123456"
  user.role = 0
end
Flatmate.find_or_create_by!(user: lounis, city: "Berlin", profile_picture_url: "https://d26jy9fbi4q9wx.cloudfront.net/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBMFFtQXc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--0236355f61e702f87b2eb68365cab14c3979c2fe/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lKYW5CbFp3WTZCa1ZVT2hOeVpYTnBlbVZmZEc5ZlptbHNiRnNJYVFISWFRSElld1k2Q1dOeWIzQTZEbUYwZEdWdWRHbHZiZz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--23cdbdf9871e44adeb4d843a03b0793a5f08394b/1651224727237.jpeg")

florian = User.find_or_create_by!(email: "florian@example.com") do |user|
  user.password = "123456"
  user.role = 0
end
Flatmate.find_or_create_by!(user: florian, city: "Berlin", profile_picture_url: "https://d26jy9fbi4q9wx.cloudfront.net/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBMHNtQXc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--4687d2a8a4cf604310ce97ba5ce42b2eea992f1f/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJYW5CbkJqb0dSVlE2RTNKbGMybDZaVjkwYjE5bWFXeHNXd2hwQWNocEFjaDdCam9KWTNKdmNEb09ZWFIwWlc1MGFXOXUiLCJleHAiOm51bGwsInB1ciI6InZhcmlhdGlvbiJ9fQ==--b67d9ded4d28d0969fbb98b4c21b79257705a99a/DSCF7547.jpg")

sree = User.find_or_create_by!(email: "https://d26jy9fbi4q9wx.cloudfront.net/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBOUFlQXc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--735e0f0dc107a2cd82ae1948bd01dfb6a9a569cd/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lKYW5CbFp3WTZCa1ZVT2hOeVpYTnBlbVZmZEc5ZlptbHNiRnNJYVFISWFRSElld1k2Q1dOeWIzQTZEbUYwZEdWdWRHbHZiZz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--23cdbdf9871e44adeb4d843a03b0793a5f08394b/Sree%20BM.jpeg") do |user|
  user.password = "123456"
  user.role = 0
end
Flatmate.find_or_create_by!(user: sree, city: "Berlin", profile_picture_url: "https://example.com/justus.jpg")

julia = User.find_or_create_by!(email: "julia@example.com") do |user|
  user.password = "123456"
  user.role = 0
end
Flatmate.find_or_create_by!(user: julia, city: "Berlin", profile_picture_url: "https://d26jy9fbi4q9wx.cloudfront.net/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBN0VsQXc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--e69bb47832fddaf0c85279c6fa026b0c86c2f9d5/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJYW5CbkJqb0dSVlE2RTNKbGMybDZaVjkwYjE5bWFXeHNXd2hwQWNocEFjaDdCam9KWTNKdmNEb09ZWFIwWlc1MGFXOXUiLCJleHAiOm51bGwsInB1ciI6InZhcmlhdGlvbiJ9fQ==--b67d9ded4d28d0969fbb98b4c21b79257705a99a/PXL_20240706_180812978b.jpg")

navid = User.find_or_create_by!(email: "navid@example.com") do |user|
  user.password = "123456"
  user.role = 0
end
Flatmate.find_or_create_by!(user: navid, city: "Berlin", profile_picture_url: "https://d26jy9fbi4q9wx.cloudfront.net/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBMVFmQXc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--3c32ba222512a7b20ed79f2f15306e9a91e12e8e/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJYW5CbkJqb0dSVlE2RTNKbGMybDZaVjkwYjE5bWFXeHNXd2hwQWNocEFjaDdCam9KWTNKdmNEb09ZWFIwWlc1MGFXOXUiLCJleHAiOm51bGwsInB1ciI6InZhcmlhdGlvbiJ9fQ==--b67d9ded4d28d0969fbb98b4c21b79257705a99a/profil%20photo%20lash.jpg")

gustavo = User.find_or_create_by!(email: "gustavo@example.com") do |user|
  user.password = "123456"
  user.role = 0
end
Flatmate.find_or_create_by!(user: gustavo, city: "Berlin", profile_picture_url: "https://avatars.githubusercontent.com/u/46820695?v=4")

# Create LivingPreferences for Hosts and Flatmates
puts "Creating Living Preferences..."
LivingPreference.create!(
  preferable: josephine_host,
  cleanliness: :neat,
  gender: :female,
  smoking: :non_smoker,
  partying: :never,
  age: :middle,
  furnished: :furnished,
  dishwasher: :has_dishwasher,
  washingmaschine: :has_washingmaschine,
  balcony: :has_balcony,
  kitchen: :has_kitchen,
  bathtub: :has_bathtub,
  aboutme: "I love to keep my home tidy and enjoy quiet evenings.",
  interest: "I enjoy reading, cooking, and hiking."
)

LivingPreference.create!(
  preferable: mustapha_host,
  cleanliness: :moderate,
  gender: :male,
  smoking: :smoker,
  partying: :sometimes,
  age: :young,
  furnished: :unfurnished,
  dishwasher: :no_dishwasher,
  washingmaschine: :no_washingmaschine,
  balcony: :no_balcony,
  kitchen: :no_kitchen,
  bathtub: :no_bathtub,
  aboutme: "I enjoy the occasional party and like to socialize.",
  interest: "My interests include gaming, movies, and traveling."
)

LivingPreference.create!(
  preferable: sascha_host,
  cleanliness: :messy,
  gender: :male,
  smoking: :social_smoker,
  partying: :often,
  age: :young,
  furnished: :furnished,
  dishwasher: :has_dishwasher,
  washingmaschine: :no_washingmaschine,
  balcony: :has_balcony,
  kitchen: :has_kitchen,
  bathtub: :has_bathtub,
  aboutme: "I am laid back and don't mind a bit of mess.",
  interest: "I love music, concerts, and hanging out with friends."
)

LivingPreference.create!(
  preferable: justus_host,
  cleanliness: :neat,
  gender: :male,
  smoking: :non_smoker,
  partying: :sometimes,
  age: :middle,
  furnished: :furnished,
  dishwasher: :has_dishwasher,
  washingmaschine: :has_washingmaschine,
  balcony: :no_balcony,
  kitchen: :has_kitchen,
  bathtub: :has_bathtub,
  aboutme: "I like to keep things organized and enjoy a balance of work and play.",
  interest: "My hobbies include coding, hiking, and playing guitar."
)

LivingPreference.create!(
  preferable: frida_flatmate,
  cleanliness: :moderate,
  gender: :female,
  smoking: :social_smoker,
  partying: :sometimes,
  age: :young,
  furnished: :furnished,
  dishwasher: :no_dishwasher,
  washingmaschine: :no_washingmaschine,
  balcony: :has_balcony,
  kitchen: :no_kitchen,
  bathtub: :no_bathtub,
  aboutme: "I am a student and I enjoy socializing and going out.",
  interest: "I like music, art, and exploring new places."
)

LivingPreference.create!(
  preferable: gavin_flatmate,
  cleanliness: :neat,
  gender: :male,
  smoking: :non_smoker,
  partying: :never,
  age: :middle,
  furnished: :furnished,
  dishwasher: :has_dishwasher,
  washingmaschine: :has_washingmaschine,
  balcony: :has_balcony,
  kitchen: :has_kitchen,
  bathtub: :has_bathtub,
  aboutme: "I value cleanliness and enjoy a quiet, peaceful environment.",
  interest: "I enjoy reading, writing, and nature walks."
)

LivingPreference.create!(
  preferable: lounis_flatmate,
  cleanliness: :messy,
  gender: :male,
  smoking: :smoker,
  partying: :often,
  age: :young,
  furnished: :unfurnished,
  dishwasher: :no_dishwasher,
  washingmaschine: :no_washingmaschine,
  balcony: :no_balcony,
  kitchen: :no_kitchen,
  bathtub: :no_bathtub,
  aboutme: "I'm pretty relaxed and don't mind a bit of chaos.",
  interest: "I love music, video games, and hanging out with friends."
)

LivingPreference.create!(
  preferable: florian_flatmate,
  cleanliness: :moderate,
  gender: :male,
  smoking: :social_smoker,
  partying: :sometimes,
  age: :middle,
  furnished: :furnished,
  dishwasher: :has_dishwasher,
  washingmaschine: :has_washingmaschine,
  balcony: :has_balcony,
  kitchen: :has_kitchen,
  bathtub: :has_bathtub,
  aboutme: "I'm easy-going but like to keep things somewhat organized.",
  interest: "I enjoy sports, movies, and spending time with friends."
)

LivingPreference.create!(
  preferable: sree_flatmate,
  cleanliness: :neat,
  gender: :female,
  smoking: :non_smoker,
  partying: :never,
  age: :middle,
  furnished: :furnished,
  dishwasher: :has_dishwasher,
  washingmaschine: :has_washingmaschine,
  balcony: :no_balcony,
  kitchen: :has_kitchen,
  bathtub: :no_bathtub,
  aboutme: "I like to maintain a clean and quiet living space.",
  interest: "I enjoy reading, yoga, and meditation."
)

LivingPreference.create!(
  preferable: julia_flatmate,
  cleanliness: :moderate,
  gender: :female,
  smoking: :social_smoker,
  partying: :sometimes,
  age: :young,
  furnished: :unfurnished,
  dishwasher: :no_dishwasher,
  washingmaschine: :no_washingmaschine,
  balcony: :has_balcony,
  kitchen: :no_kitchen,
  bathtub: :no_bathtub,
  aboutme: "I enjoy a good balance of socializing and personal time.",
  interest: "I like traveling, cooking, and photography."
)

LivingPreference.create!(
  preferable: navid_flatmate,
  cleanliness: :messy,
  gender: :male,
  smoking: :smoker,
  partying: :often,
  age: :young,
  furnished: :unfurnished,
  dishwasher: :no_dishwasher,
  washingmaschine: :no_washingmaschine,
  balcony: :no_balcony,
  kitchen: :no_kitchen,
  bathtub: :no_bathtub,
  aboutme: "I'm laid-back and enjoy a lively environment.",
  interest: "I love sports, music, and spending time with friends."
)

LivingPreference.create!(
  preferable: gustavo_flatmate,
  cleanliness: :neat,
  gender: :male,
  smoking: :non_smoker,
  partying: :never,
  age: :middle,
  furnished: :furnished,
  dishwasher: :has_dishwasher,
  washingmaschine: :has_washingmaschine,
  balcony: :has_balcony,
  kitchen: :has_kitchen,
  bathtub: :has_bathtub,
  aboutme: "I like to keep things tidy and enjoy a calm atmosphere.",
  interest: "I enjoy cooking, reading, and playing the piano."
)

# Create Likes
puts "Creating Likes..."
Like.find_or_create_by!(liker: josephine, liked: frida)
Like.find_or_create_by!(liker: mustapha, liked: navid)
Like.find_or_create_by!(liker: justus, liked: gustavo)
Like.find_or_create_by!(liker: frida, liked: josephine)
Like.find_or_create_by!(liker: gustavo, liked: sascha)

# Create Matches
puts "Creating Matches..."
Match.find_or_create_by!(flatmate: frida_flatmate, host: josephine_host)

puts "#{User.count} users (#{Host.count} hosts, #{Flatmate.count} flatmates), #{LivingPreference.count} living preferences, #{Like.count} likes, and #{Match.count} matches created."
e
