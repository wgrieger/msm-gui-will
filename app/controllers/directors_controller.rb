class DirectorsController < ApplicationController
  def index
    matching_directors = Director.all
    @list_of_directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "director_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_directors = Director.where({ :id => the_id })
    @the_director = matching_directors.at(0)

    render({ :template => "director_templates/show" })
  end

  def max_dob
    directors_by_dob_desc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :desc })

    @youngest = directors_by_dob_desc.at(0)

    render({ :template => "director_templates/youngest" })
  end

  def min_dob
    directors_by_dob_asc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :asc })
      
    @eldest = directors_by_dob_asc.at(0)

    render({ :template => "director_templates/eldest" })
  end

#add form here
  def add
   @director_name=params.fetch("director_name")
   @director_dob=params.fetch("director_dob")
   @director_bio=params.fetch("director_bio")
   @director_image=params.fetch("director_image")

   x= Director.new
   x.name=@director_name
   x.dob=@director_dob
   x.bio=@director_bio
   x.image=@director_image
   x.save

   redirect_to("/directors")
    
  end  

#update form beggining 
def update

  @director_id_to_send=params.fetch("path_id")
  @director_name_up=params.fetch("director_name_up")
  @director_dob_up=params.fetch("director_dob_up")
  @director_bio_up=params.fetch("director_bio_up")
  @director_image_up=params.fetch("director_image_up")

  x_pre=Director.all.where(:id=>@director_id_to_send)
  x=x_pre[0]
   x.name=@director_name_up
   x.dob=@director_dob_up
   x.bio=@director_bio_up
   x.image=@director_image_up
   x.save

redirect_to("/directors/#{@director_id_to_send}")

end 


end
