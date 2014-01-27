class Account < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :stripe_customer_id
    end
  end
end
