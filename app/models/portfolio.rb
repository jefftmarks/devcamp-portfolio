class Portfolio < ApplicationRecord
	include Placeholder

	validates_presence_of :title, :body, :main_image, :thumb_image

	has_many :technologies
	accepts_nested_attributes_for :technologies, reject_if: lambda { |attrs| attrs['name'].blank? }

	def self.angular
		where(subtitle: "Angular")
	end

	scope :ruby_on_rails, -> { where(subtitle: "Ruby on Rails") }

	after_initialize :set_defaults

	def set_defaults
		self.main_image ||= Placeholder.image_generator(height: '400', width: '600')
		self.thumb_image ||= Placeholder.image_generator(height: '200', width: '350')
	end
end
