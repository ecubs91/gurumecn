class AddHobbyToTutorProfiles < ActiveRecord::Migration
  def change
    add_column :tutor_profiles, :hobby_string, :string
  end
end
