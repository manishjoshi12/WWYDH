class Project < ActiveRecord::Base
  belongs_to :vacant

  def self.search(params)
    search_params = get_search_params(params)

    if search_params.empty?
      Project.all
    elsif search_params[:stage].blank?
      where("title ILIKE ? AND description LIKE ?",
      "%#{params[:title]}%", "%#{params[:description]}%")
    else
      where("title LIKE ? AND stage = ? AND description LIKE ?",
      "%#{params[:title]}%", params[:stage],
      "%#{params[:description]}%")
    end
  end

  private

  def self.get_search_params(params)
    params.slice(:title, :stage, :description)
  end

end
