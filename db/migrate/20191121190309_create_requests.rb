class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :requst_type
      t.string :text
      t.string :user_id
      t.string :uniq_url
      t.string :subject
      t.string :status

      t.timestamps
    end
  end
end
