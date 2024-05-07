class RemoveAasmStateFromVacancies < ActiveRecord::Migration[7.1]
  def change
    remove_column :vacancies, :aasm_state, :string
  end
end
