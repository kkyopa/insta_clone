class CreateTuita < ActiveRecord::Migration[5.1]
  def change
    create_table :tuita do |t|
      t.text :content
      t.timestamps
    end
  end
end
