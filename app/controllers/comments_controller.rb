class CommentsController < ApplicationController

    def create

    input_photo_id = params.fetch("query_photo_id")
    input_commenter_id = params.fetch("query_commenter_id")
    input_body = params.fetch("query_body")

    a_new_comment = Comment.new

    a_new_comment.photo_id = input_photo_id
    a_new_comment.author_id = input_commenter_id
    a_new_comment.body = input_body

    a_new_comment.save
  
    redirect_to("/photos/" + a_new_comment.photo_id.to_s)

  end

end