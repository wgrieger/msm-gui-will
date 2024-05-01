class ActorsController < ApplicationController
#beg of index 
def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
end
#end of index 

#show 
def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end
#end of show 

#add form - working
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
#end of add 

#update form beggining 
def update

        @actor_id_to_send=params.fetch("path_id")
        @actor_name_up=params.fetch("actor_name_up")
        @actor_dob_up=params.fetch("actor_dob_up")
        @actor_bio_up=params.fetch("actor_bio_up")
        @actor_image_up=params.fetch("actor_image_up")

        x_pre=Actor.all.where(:id=>@actor_id_to_send)
        x=x_pre[0]
         x.name=@actor_name_up
         x.dob=@actor_dob_up
         x.bio=@actor_bio_up
         x.image=@actor_image_up
         x.save

    redirect_to("/actors/:path_id")

  end 

#delete form not working
def delete
   @actor_id=2700143
   #params.fetch(:path_id)
    delete= Actor.all.where(:id => @actor_id).destroy.save


    redirect_to("/actors")

   end 
end
