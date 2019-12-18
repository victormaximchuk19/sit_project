class AddColumnRequestsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :staff_member_id, :string
  end
end
