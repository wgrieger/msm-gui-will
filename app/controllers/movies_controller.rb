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
  @movie_title_up=params.fetch("movie_name_up")
  @movie_year_up=params.fetch("movie_year_up")
  @movie_description_up=params.fetch("movie_description_up")
  @movie_duration_up=params.fetch("movie_duration_up")
  @movie_image_up=params.fetch("movie_image_up")

  x_pre=Movie.all.where(:id=>@movie_id_to_send)
  x=x_pre[0]
   x.title=@movie_title_up
   x.year=@movie_year_up
   x.description=@movie_description_up
   x.duration=@movie_duration_up
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

def add
  @movie_title=params.fetch("movie_title")
  @movie_year=params.fetch("movie_year")
  @movie_duration=params.fetch("movie_duration")
  @movie_description=params.fetch("movie_description")
  @movie_image=params.fetch("movie_image")
  @movie_director_id=params.fetch("movie_director_id")

  x=Movie.new
  x.title=@movie_title
  x.year=@movie_year
  x.description=@movie_description
  x.duration=@movie_duration
  x.image=@movie_image
  x.director_id=@movie_director_id
  x.save

  redirect_to("/movies")
end

end
