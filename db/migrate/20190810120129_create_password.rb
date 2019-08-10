class CreatePassword < ActiveRecord::Migration[5.2]
  def change
    create_table :passwords do |t|
      t.string :password
    end
  end
end
