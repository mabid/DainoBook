class AddProfileToUser < ActiveRecord::Migration
  def self.up
		add_column :users, :basic_current_city, :string
		add_column :users, :baisc_Info_home_town, :string
		add_column :users, :basic_info_gender, :string
		add_column :users, :basic_info_show_gender_in_profile, :boolean
		add_column :users, :basic_info_birthday, :date
		add_column :users, :basic_info_show_birthday_in_profile, :boolean
		add_column :users, :basic_info_interested_in, :string
		add_column :users, :basic_info_about_me, :string
		add_column :users, :relationship_status, :string
		add_column :users, :relative_name, :string
		add_column :users, :friends, :string
		add_column :users, :employer, :string
		add_column :users, :college_university, :string
		add_column :users, :high_school, :string
		add_column :users, :religion, :string
		add_column :users, :religion_description, :string
		add_column :users, :political_views, :string
		add_column :users, :political_views_description, :string
		add_column :users, :people_inspired_by, :string
		add_column :users, :favorite_quotations, :string
		add_column :users, :music, :string
		add_column :users, :books, :string
		add_column :users, :movies, :string
		add_column :users, :television, :string
		add_column :users, :games, :string
		add_column :users, :sports_played, :string
		add_column :users, :favorite_team, :string
		add_column :users, :favorite_athletes, :string
		add_column :users, :activities, :string
		add_column :users, :interests, :string
		add_column :users, :im_screen_name, :string
		add_column :users, :phones, :string
		add_column :users, :address, :string
		add_column :users, :city_town, :string
		add_column :users, :zip, :string
		add_column :users, :neighborhood, :string
		add_column :users, :website, :string
  end

  def self.down
		remove_column :users, :basic_current_city
		remove_column :users, :baisc_Info_home_town
		remove_column :users, :basic_info_gender
		remove_column :users, :basic_info_show_gender_in_profile
		remove_column :users, :basic_info_birthday
		remove_column :users, :basic_info_show_birthday_in_profile
		remove_column :users, :basic_info_interested_in
		remove_column :users, :basic_info_about_me
		remove_column :users, :relationship_status
		remove_column :users, :relative_name
		remove_column :users, :friends
		remove_column :users, :employer
		remove_column :users, :college_university
		remove_column :users, :high_school
		remove_column :users, :religion
		remove_column :users, :religion_description
		remove_column :users, :political_views
		remove_column :users, :political_views_description
		remove_column :users, :people_inspired_by
		remove_column :users, :favorite_quotations
		remove_column :users, :music
		remove_column :users, :books
		remove_column :users, :movies
		remove_column :users, :television
		remove_column :users, :games
		remove_column :users, :sports_played
		remove_column :users, :favorite_team
		remove_column :users, :favorite_athletes
		remove_column :users, :activities
		remove_column :users, :interests
		remove_column :users, :im_screen_name
		remove_column :users, :phones
		remove_column :users, :address
		remove_column :users, :city_town
		remove_column :users, :zip
		remove_column :users, :neighborhood
		remove_column :users, :website
  end
end
