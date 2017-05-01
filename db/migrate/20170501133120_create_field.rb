class CreateField < ActiveRecord::Migration[5.0]
  def change
    create_table :fields do |t|
      t.string :title
    end
  end
end
