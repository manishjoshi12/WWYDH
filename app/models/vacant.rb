class Vacant < ActiveRecord::Base

  # attr_accessible :fulladdress

  # It returns the articles whose titles contain one or more words that form the query
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("fulladdress like ?", "%#{query}%")
  end

end
