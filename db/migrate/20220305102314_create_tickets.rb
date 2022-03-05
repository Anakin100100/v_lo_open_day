class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|

      t.timestamps
      t.belongs_to :user
      t.integer :code, null: false
    end
  end
end
