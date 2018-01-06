require 'telegram/bot'
require 'calc'

token = ENV['TOKEN'].to_s
raise 'No token!' if token.empty?

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    response = Calc.evaluate(message.text)
    bot.api.sendMessage(chat_id: message.chat.id, text: response.to_s)
  end
end
