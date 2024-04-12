# frozen_string_literal: true

require 'faker'

5.times do
  Post.create(
    title: Faker::Hacker.unique.ingverb,
    body: Faker::Hacker.unique.say_something_smart,
    summary: Faker::Hacker.unique.adjective,
    published: false
  )
end
