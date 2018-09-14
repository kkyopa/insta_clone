class AddNameToTuita < ActiveRecord::Migration[5.1]
  def change
    add_column :tuita, :name, :string
    add_column :tuita, :user_id, :string
    add_column :tuita, :image, :text
  end
end
