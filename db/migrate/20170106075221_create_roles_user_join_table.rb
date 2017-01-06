class CreateRolesUserJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :Users, :Roles do |t|
      t.index [:role_id, :user_id]
      t.index [:user_id, :role_id]
    end
  end
end
