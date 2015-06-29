class CreateBios < ActiveRecord::Migration

  def change
    create_table :bios do |t|
      t.column :user_id, :integer, :null => false
      t.column :room, :integer
      t.column :phone, :integer
      t.column :mobile_phone, :integer
      t.column :description, :text
    end
    add_attachment :bios, :image
    add_index :bios, :user_id
  end

end
