class CreateUsersTable < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
        t.string :fname
        t.string :password
        t.timestamps
      end
  end
end
