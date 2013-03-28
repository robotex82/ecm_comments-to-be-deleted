FactoryGirl.define do
  factory :ecm_comments_comment_state, :class => Ecm::Comments::CommentState do
    sequence(:name) { |i| "Comment state ##{i}" }
    sequence(:identifier) { |i| "comment_state_#{i}" }
  end
end

