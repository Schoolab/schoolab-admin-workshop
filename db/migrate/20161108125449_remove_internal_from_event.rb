class RemoveInternalFromEvent < ActiveRecord::Migration[5.0]
  def change
    change_table :events do |t|
      t.rename :internal, :public
    end
    change_column_default :events, :public, false
  end
end
