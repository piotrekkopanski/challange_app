class QuestionsController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_question, only: [:show, :edit, :update, :destroy ]
  

  def index
    @questions = Question.all
  end

  def show
    @answer = Answer.new
    @answers = @question.answers
    @table= @answers.map { |answer| answer.accept}
  end

  def new
    @question = Question.new
  end

  def edit
  end
  
  def create
    @question = Question.new(question_params)
    @question.user = current_user

    if @question.save
      redirect_to @question, notice: 'Question was successfully created.'
    else
      render :new
    end
  end
 
  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    redirect_to @question, notice: 'Question was successfully updated.'
  end

  def destroy
    @question.destroy
    redirect_to questions_url, notice: 'Question was successfully destroyed.'
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :contents,:answer_id)
    end
end
