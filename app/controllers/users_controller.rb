class UsersController < ApplicationController
  before_action :set_user, only: [:update, :destroy]
  skip_before_action :authenticate_request, only: [:create]

  # GET /users
  # GET /users.json
  def index
    @users = User.select(:id, :first_name, :last_name, :email).all
    json_response(@users)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.select(:id, :first_name, :last_name, :email).find(params[:id])
    json_response(@user)
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      json_response({message: 'User was successfully created.'}, :created)
    else
      json_response(@user.errors.full_messages, :unprocessable_entity)
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        json_response({message: 'User was successfully updated.'})
      else
        json_response(@user.errors.full_messages, :unprocessable_entity)
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    json_response({message: 'User was successfully deleted.'})
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.permit(:first_name, :last_name, :email, :password)
  end
end
