class AddNullToArticles < ActiveRecord::Migration[5.2]
  def change
    change_table :articles do |t|
      change_column_null :articles, :title, false
      change_column_null :articles, :text, false
    end
  end
end
