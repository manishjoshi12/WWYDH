class VacantsController < ApplicationController
	def index
		@vacants = Vacant.all.paginate(page: params[:page], per_page: 10)
	end

	def show
		@vacant = Vacant.find(params[:id])
	end

	def vacant_params
		params.require(:vacant).permit(:fulladdress, :policedistrict)
	end
end
