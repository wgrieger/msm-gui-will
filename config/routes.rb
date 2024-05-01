Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })

  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  
  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })


  post("/add_director", {:controller => "directors", :action=> "add"})

  post("/add_actor", {:controller => "actors", :action=> "add"})

  post("/actors/:path_id/actor_update", 
  {:controller => "actors", :action=> "update"})
  post("/movies/:path_id/movie_update", 
  {:controller => "movies", :action=> "update"})
  post("/directors/:path_id/director_update", 
  {:controller => "directors", :action=> "update"})

  get("/actors/#{@actor_id_to_send}",{ :controller => "actors", :action => "show" })
  
  #get("/delete_actor", {:controller => "actors", :action=> "delete"})
   #get("/delete_movie", {:controller => "movie", :action=> "delete"})
end
