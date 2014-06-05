class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.integer :item_id, null: false
      t.integer :list_id, null: false
      t.boolean :bought, default: false

      t.timestamps
    end
  end
end
