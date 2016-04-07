class VacantsController < ApplicationController

	skip_before_action :ensure_login, only: [:index, :show]

	respond_to :js

	def index
    # if params[:search]
		# if params.has_key?(:neighborhood)
		@vacants = Vacant.search(params).order("id ASC")
										 .paginate(page: params[:page], per_page: 10)

		# if params.has_key?(:neighborhood)
		# 	@vacants = Vacant.where("fulladdress LIKE ? AND neighborhood LIKE ?", "%#{params[:fulladdress]}%", "%#{params[:neighborhood]}%")
		# 									 .order("id ASC").paginate(page: params[:page], per_page: 10)
	  # elsif params.has_key?(:search)
    #  	@vacants = Vacant.search(params[:search]).order("id ASC")
		# 									 .paginate(page: params[:page], per_page: 10)
		# else
    #   @vacants = Vacant.order("id ASC")
		# 									 .paginate(page: params[:page], per_page: 10)
    # end

  end

	def show
		@vacant = Vacant.find(params[:id])
	end

	def vacant_params
		params.require(:vacant).permit(:fulladdress, :policedistrict)
	end

end
