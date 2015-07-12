class AddSnsToTutorProfiles < ActiveRecord::Migration
  def change
    add_column :tutor_profiles, :wechat, :string
    add_column :tutor_profiles, :skype, :string
    add_column :tutor_profiles, :line, :string
  end
end
