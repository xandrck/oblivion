class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :name
      t.text :href
      t.text :icon
      t.string :path
      t.belongs_to :bookmark_group

      t.timestamps null: false
    end
  end
end
