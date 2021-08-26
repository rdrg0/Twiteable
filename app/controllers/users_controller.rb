class UsersController < ApplicationController
  # GET /users/:id
  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/:id/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  # PATCH/PUT /users/:id
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:username, :email, :name, :avatar,
                                 :password, :password_confirmation)
  end
end
