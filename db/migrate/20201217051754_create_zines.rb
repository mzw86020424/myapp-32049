class CreateZines < ActiveRecord::Migration[6.0]
  def change
    create_table :zines do |t|
      t.boolean    :release, default: false, null: false
      t.string     :year,    null: false
      t.string     :month,   null: false
      t.references :user,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
