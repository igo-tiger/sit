class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :name
      t.string :email
      t.string :department
      t.string :subject
      t.text :text
      t.string :ref
      t.integer :to_user
      t.integer :status

      t.timestamps
    end
  end
end
