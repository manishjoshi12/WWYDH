class Vacant < ActiveRecord::Base

  has_many :projects, dependent: :destroy

  # Returns the vacants whose address contain one or more words that form the query
  # def self.search(query)
  #   # where(:title, query) -> This would return an exact match of the query
  #   find(:all) unless query
  #
  #   if query
  #     where("fulladdress like ?", "%#{query.upcase}%")
  #   end
  # end

  def self.search(params)
    search_params = get_search_params(params)

    if search_params.empty?
      Vacant.all
    elsif search_params[:neighborhood].blank? && search_params[:policedistrict].blank?
      where("fulladdress LIKE ?", "%#{params[:fulladdress].upcase}%")
    else
      where("fulladdress LIKE ? AND neighborhood LIKE ? AND policedistrict LIKE ?",
            "%#{params[:fulladdress].upcase}%", "%#{params[:neighborhood].upcase}%",
            "%#{params[:policedistrict].upcase}%")
    end
  end

  def self.get_search_params(params)
    params.slice(:fulladdress, :neighborhood, :policedistrict)
  end

end
