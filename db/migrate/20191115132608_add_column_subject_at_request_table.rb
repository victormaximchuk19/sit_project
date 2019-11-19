class AddColumnSubjectAtRequestTable < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :subject, :string
  end
end
