class Portfolio < ApplicationRecord
	validates_presence_of :title, :body, :main_image, :thumb_image

	def self.angular
		where(subtitle: "Angular")
	end

	scope :ruby_on_rails, -> { where(subtitle: "Ruby on Rails") }

	after_initialize :set_defaults

	def set_defaults
		self.main_image ||= "https://cdn.drawception.com/images/panels/2015/3-18/mtC7PhjsqM-6.png"
		self.thumb_image ||= "https://cdn.drawception.com/images/panels/2015/3-18/mtC7PhjsqM-6.png"
	end
end
