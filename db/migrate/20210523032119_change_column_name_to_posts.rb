class ChangeColumnNameToPosts < ActiveRecord::Migration[6.0]
  def up
    rename_column :posts, :status, :published
    change_column :posts, :published, :boolean, default: false
  end

  def down
    rename_column :posts, :published, :status
    change_column :posts, :status, :boolean, default: nil
  end
end
