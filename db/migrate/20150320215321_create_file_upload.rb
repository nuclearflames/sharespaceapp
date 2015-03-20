class CreateFileUpload < ActiveRecord::Migration
  def change
    create_table :file_uploads do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.text :description
    end
  end
end
