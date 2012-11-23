class AddFlagsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :checked_in, :text
  end
end
