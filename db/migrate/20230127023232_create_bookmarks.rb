class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :photo, foreign_key: true
      t.timestamps
    end
  end
end
