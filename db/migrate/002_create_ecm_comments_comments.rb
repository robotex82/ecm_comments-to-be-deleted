class CreateEcmCommentsComments < ActiveRecord::Migration
  def change
    create_table :ecm_comments_comments do |t|
      t.string :name
      t.string :email
      t.string :homepage
      t.text :content
      t.integer :content_length
      t.string :client_ip

      # associations
      t.references :comment_state
      t.references :commentable, :polymorphic => true

      t.timestamps
    end
  end
end

