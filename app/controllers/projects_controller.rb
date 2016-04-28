class ProjectsController < ApplicationController

  skip_before_action :ensure_login, only: [:index, :show, :new, :create]

  def index
    @remote_flag = false

    @projects = Project.search(params).order("id ASC")
                       .paginate(page: params[:page], per_page: 10)
  end

  def show
    @project = Project.find(params[:id])
    @vacant = @project.vacant
    @stage = @project.stage

    case
    when @stage == 1
      project_notion
    when @stage == 2
      project_matchmaking
    when @stage == 3
      project_implementation
    else
      project_completed
    end
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

  private

  def project_params
		params.require(:project).permit(:title, :description, :vacant_id)
	end

  def project_notion
    render :project_notion
  end

  def project_matchmaking
    render :project_matchmaking
  end

  def project_implementation
    render :project_implementation
  end

  def project_completed
    render :project_completed
  end

end
