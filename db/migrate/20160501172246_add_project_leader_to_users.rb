class AddProjectLeaderToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :project_leader, index: true, foreign_key: true
  end
end
