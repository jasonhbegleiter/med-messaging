class CreateTriggerResolutionEpisodes < ActiveRecord::Migration[6.0]
  def change
    create_table :trigger_resolution_episodes do |t|
      t.references :health_episode, null: false, foreign_key: true
      t.references :trigger_resolution, null: false, foreign_key: true

      t.timestamps
    end
  end
end
