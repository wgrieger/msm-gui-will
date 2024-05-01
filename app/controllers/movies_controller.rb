class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  #update form beggining 
def update

  @movie_id_to_send=params.fetch("path_id")
  @movie_name_up=params.fetch("movie_name_up")
  @movie_dob_up=params.fetch("movie_dob_up")
  @movie_bio_up=params.fetch("movie_bio_up")
  @movie_image_up=params.fetch("movie_image_up")

  x_pre=movie.all.where(:id=>@movie_id_to_send)
  x=x_pre[0]
   x.name=@movie_name_up
   x.dob=@movie_dob_up
   x.bio=@movie_bio_up
   x.image=@movie_image_up
   x.save

redirect_to("/movies/#{@movie_id_to_send}")

end 


#delete form not working
def delete
  @movie_id=2700143
  #params.fetch(:path_id)
   delete= movie.all.where(:id => @movie_id).destroy.save


   redirect_to("/movies")

  end 


end
