class CreatePostsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
        t.string :summary, :limit => 150
        t.text :content
        t.integer :user_id
        t.timestamps
    end
  end
end
