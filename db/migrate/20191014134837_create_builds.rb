class CreateBuilds < ActiveRecord::Migration[5.2]
  def change
    create_table :builds do |t|
      t.references :project
      t.boolean :success
      t.text :output

      t.timestamps
    end
  end
end
