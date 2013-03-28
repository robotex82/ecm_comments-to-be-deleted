# This migration comes from ecm_comments_engine (originally 2)
class CreateEcmCommentsComments < ActiveRecord::Migration
  def change
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
end

