class AddCheckInToTextMessage < ActiveRecord::Migration[6.0]
  def change
    add_reference :text_messages, :check_in, index: true
  end
end
