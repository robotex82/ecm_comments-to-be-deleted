# This migration comes from ecm_comments_engine (originally 1)
class CreateEcmCommentsCommentStates < ActiveRecord::Migration
  def migrate(direction)
    super

    Ecm::Comments::CommentState.create!(:name => 'Spam', :identifier => 'spam') if direction == :up
    Ecm::Comments::CommentState.create!(:name => 'Offensive', :identifier => 'offensive') if direction == :up    
  end

  def change
    create_table :ecm_comments_comment_states do |t|
      t.string :name
      t.string :identifier
      t.text :description

      t.timestamps
    end
  end
end

