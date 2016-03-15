class Vacant < ActiveRecord::Base

  # Returns the vacants whose address contain one or more words that form the query
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("fulladdress like ?", "%#{query.upcase}%")
  end

end
