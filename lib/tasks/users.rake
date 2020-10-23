require 'csv'

namespace :users do
  desc 'Import users listing'

  def normalize_linkedin_username(personal_linkedin_url)
    return if personal_linkedin_url.blank?

    personal_linkedin_url = personal_linkedin_url.strip.downcase
    personal_linkedin_url.chop! if personal_linkedin_url.last == '/'
    personal_linkedin_url.split('/').last
  end

  def add_new_user(linkedin_username, row)
    @new_user = User.create!(linkedin_username: linkedin_username,
                             first_name: row['First Name'],
                             last_name: row['Last Name'],
                             email: row['Email'])
    add_primary_email_address_for_new_user
  end

  def add_primary_email_address_for_new_user
    @new_user.email_addresses.create!(email_address: @new_user.email, primary: true)
  end

  def add_additional_email_address_for_user(additional_email)
    return if additional_email.blank? || @user.email_addresses.pluck(:email_address).include?(additional_email)

    @user.email_addresses.create!(email_address: additional_email)
  end

  # Run with 'rake users:import'
  task import: :environment do
    @file_data = CSV.parse(File.read(Rails.root.join('data', ARGV[1])), headers: true)
    @file_data.each do |row|
      linkedin_username = normalize_linkedin_username(row['Personal Linkedin URL'])
      @user = User.find_by(linkedin_username: linkedin_username)
      @user ? add_additional_email_address_for_user(row['Email']&.strip&.downcase) : add_new_user(linkedin_username, row)
    rescue StandardError => e
      puts "Could not import #{row.to_s} #{e.message}"
    end
  end
end
