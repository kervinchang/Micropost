class AddPictureToMcposts < ActiveRecord::Migration[5.2]
  def change
    add_column :mcposts, :picture, :string
  end
end
