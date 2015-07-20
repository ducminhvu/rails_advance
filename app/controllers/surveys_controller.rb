class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
    @survey = Survey.new
  end

  def new
    @survey = Survey.new
    3.times do
      question = @survey.questions.build
      4.times {question.answers.build}
    end
  end

  def create
    survey = Survey.new survey_params
    if survey.save
      redirect_to surveys_path
    end
  end

  def edit
    @survey = Survey.find_by id: params[:id]
  end

  def update
    @survey = Survey.find_by id: params[:id]
    @survey.update_attributes survey_params
    redirect_to surveys_path
  end

  def destroy
    @survey = Survey.find_by id: params[:id]
    @survey.destroy
    redirect_to surveys_path
  end

  private
  def survey_params
    params.require(:survey).permit :name
  end
end
