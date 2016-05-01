class CreateProjectLeaders < ActiveRecord::Migration
  def change
    create_table :project_leaders do |t|
      t.references :user, null: false
      t.references :project, foreign_key: true, index: true, null: false

      t.timestamps null: false
    end
  end
end
