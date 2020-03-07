class AddCorrectQuestionToPassedTests < ActiveRecord::Migration[5.2]
  def change
    change_table :passed_tests do |t|

      t.integer :current_question, default: 0
      t.integer :correct_questions, default: 0
    end
  end
end
