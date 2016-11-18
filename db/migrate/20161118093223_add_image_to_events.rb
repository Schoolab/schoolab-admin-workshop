class AddImageToEvents < ActiveRecord::Migration[5.0]
  def up
    add_attachment :events, :image
  end

  def down
    remove_attachment :events, :image
  end
end
