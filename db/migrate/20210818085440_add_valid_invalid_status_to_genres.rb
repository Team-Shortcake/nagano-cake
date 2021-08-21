class AddValidInvalidStatusToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :valid_invalid_status, :integer, default: 0
  end
end
