class AnswersController < ApplicationController
  respond_to :html, :json,:js
  before_action :authenticate_user!
  before_action :set_question , only: [:show, :edit, :update, :destroy ,:upvote,:downvote,:create] 

  def create
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    @answer.question = @question

    if @answer.save
      redirect_to question_path(@question), notice: "Answer was successfully created."
    else
      redirect_to questions_path(@question), alert: "There was an error when adding answer."
    end
  end
   

  def upvote 
   @question = Question.find(params[:question_id])
   @answer = @question.answers.find(params[:id])
   @answer.liked_by current_user
   respond_to do |format|
   format.html 
   format.js
  end
 end

   def downvote 
   @question = Question.find(params[:question_id])
   @answer = @question.answers.find(params[:id])
   @answer.downvote_from current_user
    respond_to do |format|
   format.html 
   format.js
  end
 end

 def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def update 
    @answer = Answer.find(params[:id])
    @answer.update(answer_params)
    respond_with @question
    @question.answers.each do |answer|
     if answer.accept == true
        WelcomeMailer.notification_answer(@question).deliver
      else

     end
    end   
  end



  private
    

    def set_question
      @question = Question.find(params[:question_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:contents,:accept)
    end
   
end
