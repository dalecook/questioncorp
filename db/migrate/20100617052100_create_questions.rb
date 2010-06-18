class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :question
      t.references :user
      t.boolean :active, :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
