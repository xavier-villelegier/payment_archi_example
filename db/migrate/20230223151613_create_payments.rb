class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.float :amount
      t.datetime :captured_at

      t.timestamps
    end
  end
end
