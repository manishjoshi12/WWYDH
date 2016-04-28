class User < ActiveRecord::Base
	has_and_belongs_to_many :projects

	before_save { self.email = email.downcase }
	has_secure_password
	validates :firstname, :lastname, :email, :password, :password_confirmation, presence: true
 	validates :password, confirmation: true
	before_create :confirmation_token
	validates :username, uniqueness: { case_sensitive: true }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

 	def email_activate
 		self.email_confirmed = true
 		self_confirm_token = nil
 		save!(:validate => false)
 	end

	def self.search(params)
    search_params = get_search_params(params)

		if search_params.empty?
      users = User.all
		else
			users = User.by_firstname(search_params[:firstname])
									.by_lastname(search_params[:lastname])
		end

		users
  end

 private

 	def confirmation_token
 		if self.confirm_token.blank?
 			self.confirm_token = SecureRandom.urlsafe_base64.to_s
 		end
 	end

	# Expose incoming search parameters

	def self.get_search_params(params)
    sliced = params.compact.slice(:firstname, :lastname, :isadmin)
		sliced.delete_if { |k, v| v.blank? }
  end

	# Validate incoming search paramters

	def self.by_firstname(firstname)
		return User.all unless firstname.present?
		User.where('firstname ILIKE ?', "%#{firstname}%")
	end

	def self.by_lastname(lastname)
		return User.all unless lastname.present?
		User.where('lastname ILIKE ?', "%#{lastname}%")
	end

end
