class DestroyColumnRequestsTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :requests, :request_owner
  end
end
