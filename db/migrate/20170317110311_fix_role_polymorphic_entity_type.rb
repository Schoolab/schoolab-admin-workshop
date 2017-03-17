class FixRolePolymorphicEntityType < ActiveRecord::Migration[5.0]
  def change
    change_column :roles, :entity_type, :string
  end
end
