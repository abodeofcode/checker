class HathiController < ApplicationController
	#GET index
	def index
		UserMailer.welcome_email
	end

	#GET booking form
	def booking
		UserMailer.welcome_email()
		redirect_to action: "index"		
	end	

	#POST booking form
	def post_booking
	end
end
