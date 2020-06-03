class GroupsController < ApplicationController
  def update
    group = Group.find(params[:id])
    group.update(group_params)
    redirect_to scoreboard_path
  end

  private

  def group_params
    params.require(:group).permit(:objective)
  end
end
