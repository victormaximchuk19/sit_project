class ChangeTypeRequestsTable < ActiveRecord::Migration[5.2]
  def change
    change_column :requests, :staff_member_id, 'integer USING CAST(staff_member_id AS integer)'
  end
end
