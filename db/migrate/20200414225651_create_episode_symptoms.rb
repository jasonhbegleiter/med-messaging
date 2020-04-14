class CreateEpisodeSymptoms < ActiveRecord::Migration[6.0]
  def change
    create_table :episode_symptoms do |t|
      t.references :symptom, null: false, foreign_key: true
      t.integer :symptom_intensity
      t.references :health_episode, null: false, foreign_key: true

      t.timestamps
    end
  end
end
