class Post < ActiveRecord::Base
  attr_accessible :body,
                  :title

  has_many :comments, :as => :commentable,
                      :class_name => 'Ecm::Comments::Comment'
end
