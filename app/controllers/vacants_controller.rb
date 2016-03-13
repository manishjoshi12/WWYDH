class VacantsController < ApplicationController
	def index
		@vacants = Vacant.all
	end

	def vacant_params
		params.require(:vacant).permit(:fulladdress, :policedistrict)
	end
end

