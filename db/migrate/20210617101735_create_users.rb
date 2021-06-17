class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.integer :age
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
