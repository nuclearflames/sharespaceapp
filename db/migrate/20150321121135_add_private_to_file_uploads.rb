class AddPrivateToFileUploads < ActiveRecord::Migration
  def change
    add_column :file_uploads, :private, :boolean
  end
end
