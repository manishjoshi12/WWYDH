class VacantsController < ApplicationController
	skip_before_action :ensure_login, only: [:index, :show]
	# def index
	# 	@vacants = Vacant.all.paginate(page: params[:page], per_page: 10)
	# end

	def index
    if params[:search]
      @vacants = Vacant.search(params[:search]).order("id ASC").paginate(page: params[:page], per_page: 10)
    else
      @vacants = Vacant.order("id ASC").paginate(page: params[:page], per_page: 10)
    end
  end

	def show
		@vacant = Vacant.find(params[:id])
	end

	def vacant_params
		params.require(:vacant).permit(:fulladdress, :policedistrict)
	end
end
