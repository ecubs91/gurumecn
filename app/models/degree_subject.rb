class DegreeSubject < ActiveRecord::Base

  scope :get_all_degree_subjects, -> {pluck(:name)}

  def self.make_entries
    DegreeSubject.destroy_all
     input_ary = ["French",
    "English",
        "Korean",
        "Chinese",
    "Italian",
    "Spanish",   
    "Theology and Oriental Studies"]
    input_ary.each do |deg_sub|
      DegreeSubject.create(:name => deg_sub.downcase)
    end
  end
end
