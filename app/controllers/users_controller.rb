class UsersController < ApplicationController
 
before_action :find_user, only: [:edit, :update, :show, :destroy]  
before_action :require_user, only: [:edit, :update, :destroy]
before_action :require_same_user, only: [:edit, :update]
 
def new
  @user = User.new
end   

def create
  @user = User.new(user_params)
  if @user.save
    session[:user_id] = @user.id
    flash[:success] = "Welcome to the Alpha Blog #{@user.username}"  
    redirect_to user_path(@user)
  else
    render 'new'
  end
end

def edit
end

def update
  if @user.update(user_params)
    flash[:success] = "Your account was updated successfuly"  
    redirect_to articles_path
  else
    render 'edit'  
  end
end

def show
  @user_articles = @user.articles.paginate(page: params[:page], per_page: 5) 
end

def index
  @all_users = User.paginate(page: params[:page], per_page: 5) 
end

def destroy
end

private

def user_params
  params.require(:user).permit(:username, :email, :password) 
end

def find_user
  @user = User.find(params[:id])   
end

def require_same_user
  if current_user != @user and !current_user.admin?
    flash[:danger] = "You can edit only your account"
    redirect_to root_path
  end  
end  
    
end