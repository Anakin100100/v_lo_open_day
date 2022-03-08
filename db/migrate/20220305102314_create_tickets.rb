class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|

      t.timestamps
      t.belongs_to :user
      t.string :code, null: false
      t.string :tour, null: false
    end
  end
end
