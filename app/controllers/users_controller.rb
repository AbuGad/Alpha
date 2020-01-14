class UsersController<ApplicationController

	before_action :require_user, except: [:new]
	before_action :set_user, only:[:edit,:update,:show]
    before_action :require_same_user, only: [:edit, :update, :destroy]
   	before_action :require_admin, only: [:destroy]

 def new
	@user = User.new
 end

 def create
	@user = User.new(user_params)
  if @user.save
  	session[:user_id] = @user.id
	flash[:success] = "welcome #{@user.username}"
	redirect_to user_path(@user)
 else
	render 'new'
 end
end

 def edit
			
end

 def update
 if @user.update(user_params)
    flash[:success] = 'Your Account Was Updated Successfully'
    redirect_to articles_path
 else
	render 'edit'
 end	
end

def show
	@user_articles = @user.articles.paginate(page: params[:page], per_page: 3)
	@user = User.find(params[:id])
	#if  current_user = @user = User.find(params[:id])
	#else
        #flash[:danger] = 'you have to login first'
        #redirect_to root_path
    #end

end

def destroy
	@user = User.find(params[:id])
	@user.destroy
	flash[:danger] = "User And All Articles Have Been Deleted"
	redirect_to users_path
	
end

def index
	@users = User.paginate(page: params[:page], per_page: 3)
end

	private

	def user_params
		params.require(:user).permit(:username, :email, :password, )
	end

	def set_user
		@user = User.find_by_id(session[:user_id])
	end

	def require_admin
		if logged_in? and !current_user.admin?
			flash[:danger] = "only admin can do that"
			redirect_to root_path
		end
		
	end

	def require_same_user
		if current_user != @user and !current_user.admin?
			flash[:danger] = "You Can Only Edite Your Account"
			redirect_to root_path
		end
	end	

	def require_admin
		if logged_in? and !current_user.admin?
			flash[:danger] = 'only admin can do this action'
			redirect_to root_path
		end
		
	end
end
