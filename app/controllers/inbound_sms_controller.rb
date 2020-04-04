require 'nexmo'

class InboundSmsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    check_in = User.find_by(phone_number: params[:msisdn]).check_ins.where(status: 'incomplete').sort_by { |check_in| check_in.created_at}.first

    text_message = TextMessage.create(
      to: params[:to],
      from: params[:msisdn],
      text: params[:text],
      message_id: params[:messageId],
      is_inbound: true,
      check_in: check_in
      )

    if text_message.text == "1"
      check_in.update(status: 'complete')
    else
      check_in.update(status: 'missed')
    end
    reply(text_message)
    head :ok
  end

  private

  def reply(text_message)
    nexmo = Nexmo::Client.new(
      api_key: ENV["NEXMO_API_KEY"],
      api_secret: ENV["NEXMO_SECRET_KEY"]
    )

    nexmo.sms.send(
    from: text_message.to,
    to: text_message.from,
    text: 'We recieved your answer, thank you!'
    )
  end
end
