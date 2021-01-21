class CreateDatainserts < ActiveRecord::Migration[6.1]
  def change
    create_table :datainserts do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
