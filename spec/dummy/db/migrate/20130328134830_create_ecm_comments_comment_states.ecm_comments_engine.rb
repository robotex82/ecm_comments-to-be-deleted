# This migration comes from ecm_comments_engine (originally 1)
class CreateEcmCommentsCommentStates < ActiveRecord::Migration
  def change
    create_table :ecm_comments_comment_states do |t|
      t.string :name
      t.string :identifier
      t.text :description

      t.timestamps
    end
  end
end

