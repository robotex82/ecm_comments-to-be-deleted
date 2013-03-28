module Ecm::Comments
  class CommentState < ActiveRecord::Base
    self.table_name = 'ecm_comments_comment_states'

    # associations
    has_many :comments, :dependent => :restrict

    # attributes
    attr_accessible :name,
                    :description,
                    :identifier

    # valiations
    validates :name, :presence => true, :uniqueness => true
    validates :identifier, :presence => true, :uniqueness => true, :format => { :with => /[a-z\-]{1,}/i }

    def comments_count
      comments.count
    end
  end
end

