class CreateEnseignants < ActiveRecord::Migration[7.0]
  def change
    create_table :enseignants do |t|
      t.string :nom
      t.string :age
      t.string :diplome
      t.string :sexe

      t.timestamps
    end
  end
end
