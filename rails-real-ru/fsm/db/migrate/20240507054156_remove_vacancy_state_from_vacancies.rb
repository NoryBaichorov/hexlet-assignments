class RemoveVacancyStateFromVacancies < ActiveRecord::Migration[7.1]
  def change
    remove_column :vacancies, :vacancy_state, :string
  end
end
