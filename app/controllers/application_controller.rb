class ApplicationController < ActionController::Base
	protect_from_forgery with: :null_session
	
	def index; end
	def create
		hash = SCrypt::Password.create(params[:password],
		  max_mem: 0,
		  key_len: 512,
		  max_time: 2
		)
		pass = Password.create!(password: hash)
		redirect_to application_path(pass.id)
	end
	def show
		@password = Password.find(params[:id])
	end
end
