class RefreshAllPlJob < ApplicationJob
  queue_as :default

  def perform
    users = User.all
    users.each do |user|
      positions = Position.where(user_id: user)
      unless positions.empty?
        sum = 0
        positions.each do |position|
          if position.buy_sell == "Buy"
            sum += position.remaining_size * position.current_price
          else
            sum -= position.remaining_size * position.current_price
          end
        end
        user.equity = sum
        user.save
      end
    end
  end
end
