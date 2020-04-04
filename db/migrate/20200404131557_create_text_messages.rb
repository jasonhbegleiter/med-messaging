class CreateTextMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :text_messages do |t|
      t.string :to
      t.string :from
      t.string :text
      t.boolean :is_inbound
      t.string :message_id

      t.timestamps
    end
  end
end
