class SessionsController < Devise::SessionsController
    skip_before_action :verify_authenticity_token, only: [:create]

	def create
		# we expand the create method from devise
    puts "hello worrld"
		if request.format.json?

			password = decrypt_password(params[:user][:password])
			# binding.pry
			user_params = {
				email: params[:user][:email],
				password: password
			}

			request.params[:user].merge!(user_params)
			# internally, device, uses warden.
			# warden is using request.params
			# merge = a b, and you put b c, you get abc
		end

	    self.resource = warden.authenticate!(auth_options)
	    set_flash_message!(:notice, :signed_in)
	    sign_in(resource_name, resource)
	    yield resource if block_given?

		respond_with resource, :location => after_sign_in_path_for(resource) do |format|
	      format.json { render :json => resource } # this code will get executed for json request
	      # format.html { redirect_to after_sign_in_path_for(resource) }
	      format.html { redirect_to profiles_path }
	    end
	end

	private

	def decrypt_password(encrypted_str)
	  cipher_salt1 = 'some-random-salt-'
	  cipher_salt2 = 'another-random-salt-'
	  cipher = OpenSSL::Cipher.new('AES-128-ECB').decrypt
	  cipher.key = OpenSSL::PKCS5.pbkdf2_hmac_sha1(cipher_salt1, cipher_salt2, 20_000, cipher.key_len)
	  decrypted = [encrypted_str].pack('H*').unpack('C*').pack('c*')

	  cipher.update(decrypted) + cipher.final
	end
end





