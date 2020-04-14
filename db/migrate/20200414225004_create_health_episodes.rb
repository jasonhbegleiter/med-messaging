class CreateHealthEpisodes < ActiveRecord::Migration[6.0]
  def change
    create_table :health_episodes do |t|

      t.timestamps
    end
  end
end
