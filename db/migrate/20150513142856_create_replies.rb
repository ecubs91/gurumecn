class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer :user_id
      t.integer :blog_id
      t.text :comment

      t.timestamps
    end
  end
end
