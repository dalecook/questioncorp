class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.references :interview, :question
      t.text  :answer
      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end
