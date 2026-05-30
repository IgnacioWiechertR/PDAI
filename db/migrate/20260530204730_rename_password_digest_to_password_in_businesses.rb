class RenamePasswordDigestToPasswordInBusinesses < ActiveRecord::Migration[8.0]
  def change
    rename_column :businesses, :password_digest, :password
  end
end