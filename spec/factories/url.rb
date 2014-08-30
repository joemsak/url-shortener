FactoryGirl.define do
  factory :url do
    long 'http://something.com/valid'
    shortened_hash 'abc12'
  end
end
