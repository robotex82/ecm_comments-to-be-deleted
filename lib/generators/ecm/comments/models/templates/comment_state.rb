class Ecm::Comments::CommentState < ActiveRecord::Base
  has_many :comments, :dependent => :restrict # , :class_name => '::Ecm::Comments::Comment'
  
  validates :name, :presence => true, :uniqueness => true
  validates :identifier, :presence => true, :uniqueness => true, :format => { :with => /[a-z\-]{1,}/i }
  
  def comments_count
    comments.count
  end  
end

