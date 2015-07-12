class AddHobbToTutorProfiles < ActiveRecord::Migration
  def change
    add_column :tutor_profiles, :hobby, :string
  end
end
