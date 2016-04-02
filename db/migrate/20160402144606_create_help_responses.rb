class CreateHelpResponses < ActiveRecord::Migration
  def change
    create_table :help_responses do |t|
      t.references :responder, index: true, foreign_key: true
      t.references :help_request, index: true, foreign_key: true
      t.text :comment
      t.boolean :viewed_by_requestor

      t.timestamps null: false
    end
  end
end
