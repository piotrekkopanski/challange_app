class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_user_in_index, only: [:index]
   
 
  
  def show
   @user.points = 100
   @user.save
   @question = Question.find_by_id(params[:id])
      @user.questions.each do |question|
       @user.points = @user.points - 10
       @user.save
     end
     @user.answers.each do |answer|
      @user.points = @user.points + 5*answer.get_upvotes.count
      @user.save
     if  answer.accept == true
      @user.points = @user.points + 25
      @user.save
     else
     end
    end
   end

   def index
   
   @users = User.all
   @user = User.find_by(id: params[:user_id])
   @question = Question.find_by_id(params[:id])
    @users.each do | user|
      user.points = 100
      user.answers.each do |answer|
       answer.user.points = answer.user.points + 5*answer.get_upvotes.count
       answer.user.save
       if  answer.accept == true
      answer.user.points = answer.user.points + 25
      answer.user.save
     else
     end
     end
    
      user.questions.each do |question|
       question.user.points = question.user.points - 10
       question.user.save
     end
     end 
   end
  

  private

     def set_user_in_index
      @user = User.find_by(id: params[:user_id]) 
     end

    def set_user
      @user = User.find(params[:id])
    end
   
   def users_params
      params.require(:user).permit(:email, :encrypted_password,:points,:name,:avatar)
    end
end
