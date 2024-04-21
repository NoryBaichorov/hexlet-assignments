require 'csv'

namespace :hexlet do
  desc "Creates users by csv file"
  task :import_users, [:path] => :environment do |t, args|
    path_to_csv = args[:path]
    CSV.foreach(path_to_csv).with_index do |user, i|
      next if i == 0

      user_birthday = Date.strptime(user.third, '%m/%d/%Y')

      User.create!(
        first_name: user.first,
        last_name: user.second,
        birthday: user_birthday,
        email: user.last
      )
    end
  end

end
