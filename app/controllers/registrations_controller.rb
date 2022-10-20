# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  def create
    @user = User.new(sign_up_params)
    @user.save
    if @task.save
      format.html { redirect_to users_url(@user), notice: "User was successfully created." }
  end


  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  private

  # If you have extra params to permit, append them to the sanitizer.
  def sign_up_params
    params.permit(:name, :contact, :email, :password, :password_confirmation)
  end

  def after_sign_in_path_for(resource)
    users_path
  end

end
