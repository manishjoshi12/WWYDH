class ProjectsController < ApplicationController

  skip_before_action :ensure_login, only: [:index, :show, :new, :create]

	# def index
  #   if params[:search]
  #     @projects = Project.search(params[:search]).order("id ASC")
	# 										 .paginate(page: params[:page], per_page: 10)
  #   else
  #     @projects = Project.order("id ASC")
	# 										 .paginate(page: params[:page], per_page: 10)
  #   end
  # end

  def index
    @remote_flag = false
    
    @projects = Project.search(params).order("id ASC")
                       .paginate(page: params[:page], per_page: 10)
  end

	def show
		@project = Project.find(params[:id])
	end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
  	if @project.save
  		flash[:success] = "Created new project!"
  		redirect_to root_path
  	else
  		render 'new'
  	end
  end

	def project_params
		params.require(:project).permit(:title, :description, :stage)
	end

end
