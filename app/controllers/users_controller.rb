class UsersController < ApplicationController
     before_action :set_paper_trail_whodunnit

    def index
      @users = User.all
      @current_user = current_user
    end

    
    def edit
        @user = User.find_by(id: params[:id])
    end

    
    def logs
      @users = User.all
    end
  
    def update

      respond_to do |format|
        @user = User.find_by(id: params[:id]) 
        # get new role from radio button
        data = params[:newrole]

        # to fetch array of already assigned roles
        assigned_role = @user.roles.pluck(:name)
        #loop through aaray to delete all previous roles
        assigned_role.each do |role_name|
          @user.remove_role(role_name.to_sym)
        end  
        if params[:user].present?
          if data.to_s != "developer"
            @user.update(lead_id: nil)
            DeveloperTaskMapping.where(user_id: @user.id).destroy_all
          else
            # to get lead id from drop down select box
            leadid = params[:user][:lead_id]
            # to update the value of the lead id
            @user.update(lead_id: leadid)  
          end
        end  
        # to add new selected role for user
        if @user.add_role(data.to_s)
          UserMailer.role_changed(@user).deliver_now
          format.html { redirect_to users_url, notice: "User was successfully updated." }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end  
    end
  
    private
  
      def user_params
        params.permit(:name, :contact, :email, :newrole, :lead_id)
      end
  end