# frozen_string_literal: true

class UpdateVacancyState
  def call(vacancy:, state:)
    case state
    when Vacancy::STATE_ON_MODERATE
      vacancy.on_moderate!
    when Vacancy::STATE_PUBLISHED
      vacancy.publish!
    when Vacancy::STATE_ARCHIVED
      raise "The vacancy '#{vacancy.title}' already archived!"
    end
  end
end