class AddActionToFormat < ActiveRecord::Migration
  def self.up
    add_column  :formats, :action, :string
  end

  def self.down
    remove_column :formats, :action
  end
end
