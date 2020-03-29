# frozen_string_literal: true

class Coaches::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @coach = Coach.new
  end

  # POST /resource
  def create
    @coach = Coach.new(sign_up_params)
    unless @coach.valid?
      flash.now[:alert] = @coach.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {coach: @coach.attributes}
    session["devise.regist_data"][:coach]["password"]= params[:coach][:password]
    @address = @coach.build_address
    # render template: "coaches/registrations/new_address"
    render :new_address
  end

  def create_address
    @coach = Coach.new(session["devise.regist_data"]["coach"])
    @address = Address.new(address_params)
    unless @address.valid?
      flash.now[:alert] = @address.errors.full_messages
      render :new_address and return
    end 
    @coach.build_address(@address.attributes)
    if @coach.save
      sign_in(:coach, @coach)
    else
      flash.now[:error] = 'トレーナー情報の保存に失敗しました'
      # render template: "coaches/registrations/create_address"
      render :create_address
    end
  end

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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute,:famiy_name,:first_name,:family_name_kana,:first_name_kana,:age,:request,:birth_day])
  end

  def address_params
    params.require(:address).permit(:postal_code, :prefecture,:city,:building_name,:phone_number)
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   '/users'
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
