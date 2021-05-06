class UsersController < ApplicationController

  def index
    @list_of_users = User.all.order({ :username => :asc })

    render({ :template => "user_templates/index.html.erb"})
  end

  def show

    matching_users = User.where({ :username => params.fetch("path_username") })

    @the_user = matching_users.at(0)

    if @the_user == nil
      redirect_to("/")
    else
      render({ :template => "user_templates/show.html.erb"})
    end

  end

end