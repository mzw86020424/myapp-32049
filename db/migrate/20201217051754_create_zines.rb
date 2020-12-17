class CreateZines < ActiveRecord::Migration[6.0]
  def change
    create_table :zines do |t|

      t.timestamps
    end
  end
end
