# frozen_string_literal: true

class VacanciesController < ApplicationController
  before_action :set_vacancy, only: %i[set_published_state set_archived_state]

  def index
    @on_moderate = Vacancy.on_moderate
    @published = Vacancy.published
  end

  def new
    @vacancy = Vacancy.new
  end

  def create
    @vacancy = Vacancy.new(vacancy_params)

    if @vacancy.save
      redirect_to vacancies_path, notice: 'Vacancy was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # BEGIN
  def set_published_state
    if @vacancy.may_publish?
      @vacancy.publish

      if @vacancy.save
        redirect_back(fallback_location: vacancies_path)
        flash[:success] = 'The vacancy was successfully published'
      else
        redirect_back(fallback_location: vacancies_path)
        flash[:failure] = @vacancy.errors.full_messages.join(' ')
      end
    else
      redirect_to vacancies_path
      flash[:failure] = @vacancy.errors.full_messages.join(' ')
    end
  end

  def set_archived_state
    if @vacancy.may_archive?
      @vacancy.archive

      if @vacancy.save
        redirect_back(fallback_location: vacancies_path)
        flash[:success] = 'The vacancy was successfully archived'
      else
        redirect_back(fallback_location: vacancies_path)
        flash[:failure] = @vacancy.errors.full_messages.join(' ')
      end
    else
      redirect_to vacancies_path
      flash[:failure] = @vacancy.errors.full_messages.join(' ')
    end
  end
  # END

  private
  
  def set_vacancy
    @vacancy = Vacancy.find(params[:vacancy_id])
  end

  def vacancy_params
    params.require(:vacancy).permit(:title, :description, :aasm_state)
  end
end
