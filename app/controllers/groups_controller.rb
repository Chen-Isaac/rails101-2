class GroupsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :update, :edit, :destroy]
  before_action :find_group_and_check_permission, only: [:edit, :update, :destroy]
  def destroy

    @group.destroy
    redirect_to groups_path, alert: "Be careful! Delete Success"
  end
  def update

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

  end

  def new
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
    @posts = @group.posts
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

  def find_group_and_check_permission
    @group = Group.find(params[:id])
    if current_user != @group.user
      redirect_to groups_path, alert: "You have no permission!!!"
    end
  end
end
