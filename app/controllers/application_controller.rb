class ApplicationController < ActionController::Base
	def index; end
	def create
		hash = SCrypt::Password.create(params[:password],
		  max_mem: 0,
		  key_len: 512
		)
		pass = Password.create!(password: hash)
		redirect_to application_path(pass.id)
	end
	def show
		@password = Password.find(params[:id])
	end
end
