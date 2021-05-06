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

end