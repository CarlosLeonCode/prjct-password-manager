class PasswordsController < ApplicationController
  before_action :authenticate_user!
  before_action :password, only: [:show, :edit, :update, :destroy]

  def index
    @passwords = current_user.passwords
  end

  def show; end

  def new
    @password = Password.new
  end

  def create
    @password = current_user.passwords.create(password_params)
    if @password.persisted?
      redirect_to @password
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @password.update(password_params)
      redirect_to @password
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @password.destroy
    redirect_to passwords_path
  end

  private

  def password_params
    params.require(:password).permit(:name, 
      :username, 
      :password, 
      :url
    )
  end

  def password
    @password ||= current_user.passwords.find(params[:id])
  end
end
