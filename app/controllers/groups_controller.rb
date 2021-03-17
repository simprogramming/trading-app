class GroupsController < ApplicationController

  before_action :set_group, only: [:update]

  def update
    @group.update(group_params)
    redirect_to root_path
    flash[:notice] = 'Group info successfully updated'
  end

  private

  def group_params
    params.require(:group).permit(:tow_titre, :bull, :bear)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
