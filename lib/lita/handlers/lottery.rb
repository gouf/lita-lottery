module Lita
  module Handlers
    class Lottery < Handler
      # insert handler code here
      route(/lottery/, :lottery)
      route(/chusen/, :lottery)
      route(/tyusen/, :lottery)

      def lottery(response)
        users = ENV['CSV_USER_NAMES']&.split(',')
        return if users.nil?

        sender_name = response.user&.name
        user = users.reject { |x| x.eql?(sender_name) }.sample
        response.reply "抽選結果: @#{user}"
      end

      Lita.register_handler(self)
    end
  end
end
