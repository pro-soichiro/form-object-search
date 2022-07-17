class CreateBirthplaces < ActiveRecord::Migration[6.1]
  def change
    create_table :birthplaces do |t|
      t.references :prefecture, null: false, foreign_key: true
      t.string :detail, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
