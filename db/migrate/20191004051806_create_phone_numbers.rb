class CreatePhoneNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :phone_numbers do |t|
      t.integer :no
      t.boolean :assigned

      t.timestamps
    end
  end
end
