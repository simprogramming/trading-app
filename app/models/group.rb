class Group < ApplicationRecord

  def initial_amount
    player = @users.count
    if @user.cash = 0
      player -= 1
    end
  end

end
