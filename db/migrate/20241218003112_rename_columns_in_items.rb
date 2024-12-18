class RenameColumnsInItems < ActiveRecord::Migration[7.0]
  def change
    rename_column :items, :shipping_date_id, :shipping_day_id
  end
end
