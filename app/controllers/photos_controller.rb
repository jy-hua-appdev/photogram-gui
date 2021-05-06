class PhotosController < ApplicationController

  def index

    @list_of_photos = Photo.all.order({ :created_at => :desc })

    render({ :template => "/photo_templates/index.html.erb" })

  end

  def show

    matching_photos = Photo.where({ :id => params.fetch("path_id") })

    @the_photo = matching_photos.at(0)

    render({ :template => "/photo_templates/show.html.erb" })

  end

  def delete

    matching_photos = Photo.where({ :id => params.fetch("path_id") })

    the_photo = matching_photos.at(0)

    the_photo.destroy

    redirect_to("/photos")

  end

  def create

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")

    a_new_photo = Photo.new

    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save
  
    redirect_to("/photos/" + a_new_photo.id.to_s)

  end

end