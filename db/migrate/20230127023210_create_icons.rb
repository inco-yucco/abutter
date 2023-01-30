class CreateIcons < ActiveRecord::Migration[6.1]
  def change
    create_table :icons do |t|
      # t.string :content, null: false
      t.timestamps
    end
  end
end
