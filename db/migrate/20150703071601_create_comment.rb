class CreateComments < ActiveRecord::Migration
  def up
  end

  def down
  end

  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :link_id
      t.text 	:message

      t.timestamps
    end
  end
end
