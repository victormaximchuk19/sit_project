class AddNewColumnAtRequestTable < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :uniq_url, :string 
  end
end
