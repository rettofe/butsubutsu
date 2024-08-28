class CreateTrades < ActiveRecord::Migration[7.0]
  def change
    create_table :trades do |t|
        t.references :item1, null: false, foreign_key: { to_table: :items }
        t.references :item2, null: false, foreign_key: { to_table: :items }
        t.references :user1, null: false, foreign_key: { to_table: :users }
        t.references :user2, null: false, foreign_key: { to_table: :users }
        t.string :status, null: false, default: 'pending'
  
        t.timestamps
      end
    end
  end
