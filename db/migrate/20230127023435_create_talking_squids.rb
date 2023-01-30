class CreateTalkingSquids < ActiveRecord::Migration[6.1]
  def change
    create_table :talking_squids do |t|
      t.text :comment, null: false
      t.timestamps
    end
  end
end
