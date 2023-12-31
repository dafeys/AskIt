class QuestionsController < ApplicationController
  before_action :set_question!, only: %i[show destroy edit update]

  def index
    @pagy, @questions = pagy(Question.order(created_at: :desc), items: 20)
    #@questions = Question.order(created_at: :desc).page params[:page]
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new question_params
    if @question.save
      flash[:success] = "Question created successfully!"
      redirect_to questions_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update question_params
      flash[:success] = "Question updated successfully!"
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    flash[:success] = "Question deleted successfully!"
    redirect_to questions_path
  end

  def show
    @answer = @question.answers.build
    #@answers = Answer.order created_at: :desc
    #@answers = Answer.where(question_id: @question).order(created_at: :desc)
    @pagy, @answers = pagy(@question.answers.order(created_at: :desc), items: 5)
    #@answers = @question.answers.order(created_at: :desc).page params[:page]
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def set_question!
    @question = Question.find params[:id]
  end
end