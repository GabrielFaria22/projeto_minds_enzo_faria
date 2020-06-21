class CreateAssisteds < ActiveRecord::Migration[5.2]
  def change
    create_table :assisteds do |t|
      t.string :name
      t.boolean :gender
      t.string :address
      t.string :name_mother
      t.string :name_father
      t.string :cpf, null: false, default: ""
      t.boolean :status, null: false, default: true
      t.integer :phone1
      t.integer :phone2
      t.string :email
      t.text :observation

      t.timestamps
    end
  end
end
