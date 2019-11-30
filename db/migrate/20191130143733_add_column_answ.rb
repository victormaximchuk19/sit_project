class AddColumnAnsw < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :request_url, :string
  end
end
