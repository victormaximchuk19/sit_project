class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :type
      t.string :text

      t.timestamps
    end
  end
end
