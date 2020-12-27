class NotifySubscribersJob < ApplicationJob
  queue_as :default

  def perform(*args)
    text = args[0]
    Subscribe.all do |subscribe|
      TelegramService.instance.send_message(text, subscribe.chat_name)
    end
  end
  NotifySubscribersJob.set(wait_until: Date.tomorrow.noon).perform_later("L")
end
