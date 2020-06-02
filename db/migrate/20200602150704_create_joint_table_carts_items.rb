class CreateJointTableCartsItems < ActiveRecord::Migration[5.2]
  def change
    
    create_table :joint_table_carts_items, :id => false do |t|

      t.belongs_to :item, index: true
      t.belongs_to :cart, index: true

      t.timestamps
    end
  end
end
