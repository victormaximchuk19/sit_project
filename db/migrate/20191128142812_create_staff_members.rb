class CreateStaffMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :staff_members do |t|
      t.string :name
      t.string :password_digest

      t.timestamps
    end
  end
end
