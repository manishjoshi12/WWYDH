class ProjectLeader < ActiveRecord::Base

  belongs_to :project
  has_one :user

  validates_presence_of :project, :user

end
