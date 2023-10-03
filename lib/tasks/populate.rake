# lib/tasks/populate.rake
namespace :db do
  desc "Populate database with sample data"
  task 'populate' => :environment do
    load Rails.root.join('db', 'seeds', 'app_city.rb')
    load Rails.root.join('db', 'seeds', 'app_institution.rb')
    load Rails.root.join('db', 'seeds', 'app_course.rb')
    load Rails.root.join('db', 'seeds', 'app_calendar.rb')
    load Rails.root.join('db', 'seeds', 'app_company.rb')
    load Rails.root.join('db', 'seeds', 'app_role_vendor.rb')
    load Rails.root.join('db', 'seeds', 'app_status_negotiation.rb')
    load Rails.root.join('db', 'seeds', 'app_status_interaction.rb')
    load Rails.root.join('db', 'seeds', 'app_vendor.rb')

    load Rails.root.join('db', 'seeds', 'app_negotiation.rb')

    load Rails.root.join('db', 'seeds', 'app_interaction.rb')
    load Rails.root.join('db', 'seeds', 'app_prospect.rb')
    load Rails.root.join('db', 'seeds', 'app_contact.rb')

  end
end



