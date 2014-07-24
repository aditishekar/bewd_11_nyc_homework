class MoviesController < ApplicationController
  def index
    @movies = Movie.search_for(params[:q])
  end

  def show
    @movies = Movie.find_by id: params[:id]
  end

  def new
  	@movies = Movie.new 
  end	

  def create
  	@movie = movie.new(safe_movie_params)
  	if @movie.save 
  	redirect_to movie_path(@movie)	
  end

  def edit
  	load_movie
  end

  def update
  	load_movie
  	@movie.update safe_movie_params

  	redirect_to movie_path(@movie)
  end

  private
  def get safe_movie_params
  	params.require ('movie'), permit(:title, :description)
  end

  def load_movie
  	@movie = movie.find_by id: params (:id)
  end
end
