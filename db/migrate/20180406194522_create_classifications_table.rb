class CreateClassificationsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :classifications do |t|
      t.string :catagories
    end
  end
end
