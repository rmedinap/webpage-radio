class AddLinkToDiapositivas < ActiveRecord::Migration
  def change
    add_column :diapositivas, :link, :string
  end
end
