FactoryGirl.define do
  factory :ecm_comments_comment, :class => Ecm::Comments::Comment do
    name 'John Doe'
    email 'john.doe@example.com'
    client_ip '127.0.0.1'
    content 'This is an example comment.'
    association(:commentable, :factory => :post)
  end
end

