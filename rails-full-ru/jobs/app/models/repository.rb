# frozen_string_literal: true

class Repository < ApplicationRecord
  include AASM

  validates :link, presence: true, uniqueness: true

  # BEGIN
  aasm column: 'aasm_state' do
    state :created, initial: true
    state :fetching, :fetched, :failed

    event :start_fetch do
      transitions from: %i[created fetched failed], to: :fetching
    end

    event :success_fetch do
      transitions from: :fetching, to: :fetched
    end

    event :fail do
      transitions from: :fetching, to: :failed
    end
  end
  # END
end
