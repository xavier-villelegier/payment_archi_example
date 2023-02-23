class CreateAdyenPaymentEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :adyen_payment_events do |t|
      t.json :metadata
      t.text :psp_reference
      t.references :payment_event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
