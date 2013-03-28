require 'spec_helper'

module Ecm::Comments
  describe CommentsController do
    describe 'POST create' do
      before do
        @post = FactoryGirl.create(:post)
        request.env["HTTP_REFERER"] = post_path(@post)
        post :create, :ecm_comments_comment => FactoryGirl.attributes_for(:ecm_comments_comment)
      end # before

      it 'should redirect to back' do
        response.should redirect_to(post_path(@post))
      end # it
    end # describe 'POST create'
  end # describe CommentsController
end # module Ecm::Comments
