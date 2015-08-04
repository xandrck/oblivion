class CreateStorages < ActiveRecord::Migration
  def change
    create_table :storages do |t|
      t.string :title
      t.text :url

      t.timestamps null: false
    end
  end
end
