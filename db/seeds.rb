require "faker"

10.times do |x|
	Blog.create!(
		title: "My Blog Post #{x}",
		body: Faker::Lorem.paragraph
	)
end

puts "10 blog posts created"

5.times do |x|
	Skill.create!(
		title: "Rails #{x}",
		percent_utilized: rand(0..100)
	)
end

puts "5 skills created"

9.times do |x|
	Portfolio.create!(
		title: "Portfolio Title: #{x}",
		subtitle: "My Great Service",
		body: Faker::Lorem.sentences(number: 2).join(" "),
		thumb_image: "../app/assets/images/dummy_image.png",
		main_image: "../app/assets/images/big_image.png"
	)
end

puts "9 portfolio items created"