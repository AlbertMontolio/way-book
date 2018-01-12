class SessionsController < Devise::SessionsController
    skip_before_action :verify_authenticity_token, only: [:create]

	# we expand the create method from devise

	def create
		# binding.pry
		params[:password] = decrypt_password(user_params[:password])
		#params[:password] = user_params[:password]
		# binding.pry
		# POST /resource/sign_in

	    self.resource = warden.authenticate!(auth_options)
	   	# binding.pry
	    set_flash_message!(:notice, :signed_in)
	    # binding.pry
	    sign_in(resource_name, resource)
	    yield resource if block_given?

		# super
		respond_with resource, :location => after_sign_in_path_for(resource) do |format|
	      format.json { render :json => resource } # this code will get executed for json request
	      format.html { redirect_to after_sign_in_path_for(resource) }
	    end
	end

	private

	def decrypt_password(encrypted_password)
		crypt = ActiveSupport::MessageEncryptor.new("test")
		binding.pry
		decrypted_back = crypt.decrypt_and_verify(encrypted_password)

		return decrypted_back
	end

	def user_params
		params.require(:user).permit(:email, :password)
	end 

end




