class User < ActiveRecord::Base
	has_secure_password
	validates :firstname, :lastname, :email, :password, presence: true
 	validates :password, confirmation: true
 	validates :password_confirmation, presence: true

 	

end
