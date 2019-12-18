class RenameColumnAnswers < ActiveRecord::Migration[5.2]
  def change
    rename_column :answers, :request_url, :request_id
  end
end
