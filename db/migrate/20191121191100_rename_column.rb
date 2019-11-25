class RenameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :requests, :requst_type, :request_type
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
