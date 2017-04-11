class GroupsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create]
  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path, alert: "Be careful! Delete Success"
  end
  def update
    @group = Group.find(params[:id])

    if @group.update(group_params)
      redirect_to groups_path, notice: "Good Lord! Update Success"
    else
      render :edit
    end
  end
  def index
    @groups = Group.all
  end

  def edit
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:title, :description)
  end
end
