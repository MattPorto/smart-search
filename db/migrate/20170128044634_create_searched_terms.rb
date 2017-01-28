class CreateSearchedTerms < ActiveRecord::Migration[5.0]
  def change
    create_table :searched_terms do |t|
      t.string :term
      t.integer :popularity

      t.timestamps
    end
  end
end
