# frozen_string_literal: true

require 'faker'

10.times do
  Task.create!(
    name: Faker::Job.unique.field,
    description: Faker::Lorem.unique.paragraph,
    status: 'New',
    creator: Faker::Name.unique.name,
    performer: Faker::Name.unique.name,
    completed: true
  )
end
