class CreateEcmCommentsCommentStates < ActiveRecord::Migration
  def self.up
    create_table :ecm_comments_comment_states do |t|
      t.string :name
      t.string :identifier
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :ecm_comments_comment_states
  end
end
