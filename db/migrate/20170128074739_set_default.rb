class SetDefault < ActiveRecord::Migration[5.0]
  def change
    change_column :searched_terms, :popularity, :integer, default: 1
  end
end
