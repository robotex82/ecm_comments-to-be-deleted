class CreateEcmCommentsComments < ActiveRecord::Migration
  def self.up
    create_table :ecm_comments_comments do |t|
      t.string :fullname
      t.string :email
      t.string :homepage
      t.text :content
      t.integer :content_length
      t.string :ip_address
      t.references :comment_state
      t.references :commentable, :polymorphic => true      

      t.timestamps
    end
  end

  def self.down
    drop_table :ecm_comments_comments
  end
end
