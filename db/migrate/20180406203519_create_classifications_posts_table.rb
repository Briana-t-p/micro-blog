class CreateClassificationsPostsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :classification_posts do |t|
      t.integer :post_id
      t.integer :classification_id
    end
  end
end
