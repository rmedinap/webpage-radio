class AddLinkToDjs < ActiveRecord::Migration
  def change
    add_column :djs, :link, :string
  end
end
