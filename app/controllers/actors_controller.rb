class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end

  #add form here
  def add
    @actor_name=params.fetch("actor_name")
    @actor_dob=params.fetch("actor_dob")
    @actor_bio=params.fetch("actor_bio")
    @actor_image=params.fetch("actor_image")
 
    x=Actor.new
    x.name=@actor_name
    x.dob=@actor_dob
    x.bio=@actor_bio
    x.image=@actor_image
    x.save
 
    redirect_to("/actors")
     
   end  

   def update
    @actor_name=params.fetch("actor_name")
    @actor_dob=params.fetch("actor_dob")
    @actor_bio=params.fetch("actor_bio")
    @actor_image=params.fetch("actor_image")

    x= Actor.all.where(:id => @actor_to_update)
    x.name=@actor_name
    x.dob=@actor_dob
    x.bio=@actor_bio
    x.image=@actor_image
    x.save


    redirect_to("/actors/:path_id")

   end 


   #not working
   def delete
   @actor_id=2700143
   #params.fetch(:path_id)
    delete= Actor.all.where(:id => @actor_id).destroy.save


    redirect_to("/actors")

   end 


end
