class PagesController < ApplicationController
	def index
		logger = EventLogger::Logger.new
		logger.log("hello.world", "bye_world") do |messages|
			messages << "Привет, мир!"
			raise "HEY"
		end
	end
end