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

  def create

    input_username = params.fetch("query_username")

    a_new_user = User.new

    a_new_user.username = input_username

    a_new_user.save

    redirect_to("/users/" + a_new_user.username.to_s)

  end

  def update
  
    matching_users = User.where({ :id => params.fetch("modify_id") })

    the_user = matching_users.at(0)

    input_username = params.fetch("query_username")

    the_user.username = input_username
    
    the_user.save

    redirect_to("/users/" + the_user.username.to_s)

  end

end