class ChangeDateColumnTypeInTweets < ActiveRecord::Migration[6.1]
  def change
    change_column :tweets, :date, :date
  end
end
