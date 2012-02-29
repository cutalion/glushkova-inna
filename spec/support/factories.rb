FactoryGirl.define do 
  factory :photo do |f|
    f.title       { Faker::Lorem.words.join(" ") }
    f.description { Faker::Lorem.paragraph }
    f.image       { File.open Dir.glob(File.join(Rails.root.to_s, "spec/support/images/*.jpg")).sample }
  end

  factory :album do |f|
    f.title       { Faker::Lorem.words.join(" ") }
  end
end
