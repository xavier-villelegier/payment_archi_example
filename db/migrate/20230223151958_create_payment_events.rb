class CreatePaymentEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_events do |t|
      t.text :provider
      t.text :event_type
      t.references :payment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
