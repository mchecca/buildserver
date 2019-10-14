class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :git_clone_url
      t.text :script

      t.timestamps
    end
  end
end
