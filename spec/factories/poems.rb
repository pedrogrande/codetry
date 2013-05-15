# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :poem do
    title 'Poem1'
    content 'The content of Poem 1 goes here().'
    language 'ruby'
    tags 'tag1, tag2'
  end
end
