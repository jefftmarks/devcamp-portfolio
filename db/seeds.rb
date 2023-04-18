require "faker"

3.times do |x|
	Topic.create!(
		title: "Topic"
	)
end

10.times do |x|
	Blog.create!(
		title: "My Blog Post #{x}",
		body: Faker::Lorem.paragraph,
		topic_id: Topic.all.sample.id
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

8.times do |x|
	Portfolio.create!(
		title: "Portfolio Title: #{x}",
		subtitle: "Ruby on Rails",
		body: Faker::Lorem.sentences(number: 2).join(" "),
		thumb_image: "https://www.colorbook.io/imagecreator.php?width=350&height=200",
		main_image: "https://www.colorbook.io/imagecreator.php?width=600&height=400"
	)
end

puts "8 portfolio items (Rails) created"

1.times do |x|
	Portfolio.create!(
		title: "Portfolio Title: #{x}",
		subtitle: "Angular",
		body: Faker::Lorem.sentences(number: 2).join(" "),
		thumb_image: "https://www.colorbook.io/imagecreator.php?width=350&height=200",
		main_image: "https://www.colorbook.io/imagecreator.php?width=600&height=400"
	)

	puts "1 portfolio items (Angular) created"
end

3.times do |x|
	Portfolio.last.technologies.create!(name: "Technology #{x}")
end

puts "3 technologies created"
