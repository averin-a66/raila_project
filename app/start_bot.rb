require 'singleton'
require 'telegram/bot'
class TelegramService
  include Singleton
  @token = '1462396980:AAEjutWPFbNJAIUcW0chn9DVzC_RjeoGPp4'
  def initialize(token)

  end
  def send_message
    Telegram::Bot::Client.run(@token) do |bot|
      bot.api.send_message(chat_id: ENV['TELEGRAM_CHAT_ID'], text: "")
    end
  end
  def new_subscribe(id)
    text = if Subscribe.find_by_chat_name(id).present?
             'Already Subscribed'
           else
             Subscribe.create(chat_name: id).valid? ? 'Subscribed!' : 'Can\'t Subscribed!'
           end
    @bot.api.send_message(chat_id: id, text: text)
  end
  def start
    Thread.new do
      Telegram::Bot::Client.run(@token) do |bot|
        bot.listen do |message|
          case message.text
          when '/start'
            bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
          when '/stop'
            bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
          when '/subscribe'
            new_subscribe(message.chat.id)
          when '/unsubscribe'
            unsubscribe(message.chat.id)
          end
        end
      end
    rescue StandardError => e
      Rails.logger.error e.message
    end

  end
  def create
    recipe=Recipe.last
      NotifySubscribersJob.set(wait_until: Date.tomorrow.noon).perform_later("Добавлен новый рецепт! Зайдите и посмотрите!")
      redirect_to recipe_path
  end

  end
