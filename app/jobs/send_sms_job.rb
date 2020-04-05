require 'nexmo'

class SendSmsJob < ApplicationJob
  queue_as :default

  def perform(check_in_id)
    check_in = CheckIn.find(check_in_id)
    user = check_in.prescription.user

    nexmo = Nexmo::Client.new(
      api_key: ENV["NEXMO_API_KEY"],
      api_secret: ENV["NEXMO_SECRET_KEY"]
    )

    notification = "Hi! It's time for you to take: \n\n '#{check_in.prescription.product.name}, #{check_in.prescription.amount}mg' \n\n" +
                   "Instructions: #{check_in.prescription.instructions}\n\n" +
                   "If completed, reply \"1\" \n\n If not completed, reply \"2\".\n\n" +
                   "Med Messaging"

    nexmo.sms.send(
        from: ENV["NEXMO_PHONE_NUMBER"],
        to: user.phone_number,
        text: notification
      )

  end
end
