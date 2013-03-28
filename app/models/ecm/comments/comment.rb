module Ecm::Comments
  class Comment < ActiveRecord::Base
    belongs_to :commentable, :polymorphic => true
    belongs_to :comment_state

    attr_accessor :nickname
    # alias :comment_state :ecm_comments_comment_state

    validates :commentable_type, :presence => true
    validates :commentable_id, :presence => true
    validates :fullname, :presence => true
    validates :email, :presence => true
    validates :content, :presence => true
    validates :ip_address, :presence => true

    validates :commentable_type, :unchanged => true, :on => :update
    validates :commentable_id, :unchanged => true, :on => :update
    validates :fullname, :unchanged => true, :on => :update
    validates :email, :unchanged => true, :on => :update
    validates :content, :unchanged => true, :on => :update
    validates :ip_address, :unchanged => true, :on => :update

    default_scope :order => 'created_at ASC'

    before_create :not_automatic_spam?
    before_save :update_content_length

    def update_content_length
      self.content_length = self.content.length
    end

    def spam?
      self.comment_state == ::Ecm::Comments::CommentState.where(:identifier => 'spam').first
    end

    def offensive?
      self.comment_state == ::Ecm::Comments::CommentState.where(:identifier => 'offensive').first
    end

    def spam!
      self.update_attribute(:comment_state_id, ::Ecm::Comments::CommentState.where(:identifier => 'spam').first.id)
    end

    def offensive!
      self.update_attribute(:comment_state_id, ::Ecm::Comments::CommentState.where(:identifier => 'offensive').first.id)
    end

    def not_spam!
      self.update_attribute(:comment_state_id, nil)
    end

    def not_offensive!
      self.update_attribute(:comment_state_id, nil)
    end

    def self.spam
      where(:comment_state_id => ::Ecm::Comments::CommentState.where(:identifier => 'spam').first)
    end

    def self.offensive
      where(:comment_state_id => ::Ecm::Comments::CommentState.where(:identifier => 'offensive').first)
    end

    # In development, raises an error if the captcha field is not blank. This is
    # is good to remember that the field should be hidden with CSS and shown only
    # to robots.
    #
    # In test and in production, it returns true if all captcha fields are blank,
    # returns false otherwise.
    #
    def automatic_spam?
      # self.class.mail_captcha.each do |field|
      [:nickname].each do |field|
        next if send(field).blank?

        if defined?(Rails) && Rails.env.development?
          raise ScriptError, "The captcha field #{field} was supposed to be blank"
        else
          return true
        end
      end

      false
    end

    def not_automatic_spam?
      !automatic_spam?
    end
  end
end

