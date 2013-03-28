module Ecm::Comments
  class Comment < ActiveRecord::Base
    self.table_name = 'ecm_comments_comments'

    # associations
    belongs_to :commentable, :polymorphic => true
    belongs_to :comment_state

    # attributes
    attr_accessor :nickname # virtual attribute for anti-spam
    attr_accessible :commentable_type,
                    :commentable_id,
                    :nickname,
                    :name,
                    :homepage,
                    :content,
                    :email

    # callbacks
    before_create :not_automatic_spam?
    before_create :format_homepage
    before_save :set_content_length

    # validations
    validates :commentable_type, :presence => true
    validates :commentable_id, :presence => true
    validates :name, :presence => true
    validates :email, :presence => true
    validates :content, :presence => true
    validates :client_ip, :presence => true

    validates :commentable_type, :unchanged => true, :on => :update
    validates :commentable_id, :unchanged => true, :on => :update
    validates :name, :unchanged => true, :on => :update
    validates :email, :unchanged => true, :on => :update
    validates :content, :unchanged => true, :on => :update
    validates :client_ip, :unchanged => true, :on => :update

    default_scope :order => 'created_at ASC'

    def format_homepage
      self.homepage = "http://#{self.homepage}" unless self.homepage[/^https?/]
    end

    def set_content_length
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

