class CreateConfirmations < ActiveRecord::Migration[5.2]
  def change
    create_table :confirmations do |t|
      t.belongs_to :week, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
