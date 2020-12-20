require 'singleton'
require 'telegram/bot'
class TelegramService
  include Singleton
  token = '1462396980:AAEjutWPFbNJAIUcW0chn9DVzC_RjeoGPp4'
  def initialize(token)

  end
  def send_message(message)

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
          end
        end
      end
    rescue StandardError => e
      Rails.logger.error e.message
    end

  end
  def create
    recipe_params = params[:recipe]
    question = Recipe.new(title: recipe_params[:name],
                            body: recipe_params[:body])
    question.user = @current_user
    question.save
    if question.valid?
      #вроде тут
      redirect_to question
    else
      flash[:alert] =
          'Не удалось создать вопрос.'
      redirect_to new_question_path
    end
  end
  end
