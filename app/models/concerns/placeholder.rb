module Placeholder
	extend ActiveSupport::Concern

	def self.image_generator(height:, width:)
		"https://www.colorbook.io/imagecreator.php?width=#{width}&height=#{height}"
	end
end