FactoryBot.define do
  factory :task do
    name { "Task" }
    description { "Description" }
    priority { "1" }
    list { nil }
  end
end