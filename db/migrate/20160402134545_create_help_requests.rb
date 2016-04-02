class CreateHelpRequests < ActiveRecord::Migration
  def change
    create_table :help_requests do |t|
      t.string :title
      t.integer :category
      t.references :creator, index: true, foreign_key: true
      t.datetime :deadline
      t.integer :status
      t.references :assistant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
