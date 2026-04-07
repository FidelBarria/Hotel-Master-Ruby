class AddForeingKey < ActiveRecord::Migration[8.1]
  def change
    add_foreign_key :users, :hotels, on_delete: :cascade
  end
end
