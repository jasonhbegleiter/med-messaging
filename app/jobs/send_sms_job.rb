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

    # if User is from the united states, send it from the US number
    sending_phone_number = user.phone_number[0] == "1" ? ENV["NEXMO_PHONE_NUMBER_US"] : ENV["NEXMO_PHONE_NUMBER_ISRAEL"]

    nexmo.sms.send(
        from: sending_phone_number,
        to: user.phone_number,
        text: notification
      )

  end
end
