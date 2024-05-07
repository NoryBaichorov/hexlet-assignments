class AddAasmStateToVacancies < ActiveRecord::Migration[7.1]
  def change
    add_column :vacancies, :aasm_state, :string
  end
end
