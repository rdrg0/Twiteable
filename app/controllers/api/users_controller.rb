class Api::UsersController < ApiController
  # GET /users/:id
  def index
    render json: User.all
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.save
    render json: @user
  end

  # PATCH/PUT /users/:id
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    render json: @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    head :no_content
  end

  private

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:username, :email, :name, :avatar,
                                 :password, :password_confirmation)
  end
end
