class ChangingTypes < ActiveRecord::Migration[5.2]
  def change
    change_column :requests, :user_id, 'integer USING CAST(user_id AS integer)'
  end
end
