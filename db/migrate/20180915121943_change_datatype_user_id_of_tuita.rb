class ChangeDatatypeUserIdOfTuita < ActiveRecord::Migration[5.1]
  def change
    change_column :tuita, :user_id, 'integer USING CAST(user_id AS integer)'
  end
end