class Vacant < ActiveRecord::Base
	def create
		Vacant.new(vacant_params)
	end
end
