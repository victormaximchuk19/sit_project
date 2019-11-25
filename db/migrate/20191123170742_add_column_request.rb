class AddColumnRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :request_owner, :string
  end
end
