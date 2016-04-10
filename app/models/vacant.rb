class Vacant < ActiveRecord::Base

  has_many :projects, dependent: :destroy

  def self.search(params)
    search_params = get_search_params(params)

    if search_params.empty?
      vacants = Vacant.all
    else
			vacants = Vacant.by_fulladdress(search_params[:fulladdress])
									    .by_neighborhood(search_params[:neighborhood])
				              .by_policedistrict(search_params[:policedistrict])
		end

		vacants
  end

  private

  # Expose incoming search parameters

  def self.get_search_params(params)
    sliced = params.compact.slice(:fulladdress, :neighborhood, :policedistrict)
		sliced.delete_if { |k, v| v.blank? }
  end

  # Validate incoming search paramters

	def self.by_fulladdress(fulladdress)
		return Vacant.all unless fulladdress.present?
		Vacant.where('fulladdress LIKE ?', "%#{fulladdress.upcase}%")
	end

  def self.by_neighborhood(neighborhood)
		return Vacant.all unless neighborhood.present?
		Vacant.where('neighborhood LIKE ?', "%#{neighborhood.upcase}%")
	end

  def self.by_policedistrict(policedistrict)
		return Vacant.all unless policedistrict.present?
		Vacant.where('policedistrict LIKE ?', "%#{policedistrict.upcase}%")
	end

end
