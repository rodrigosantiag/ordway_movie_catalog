class MoviesController < ApplicationController

  def index
    @movies = Movie.all.order(:title).page params[:page]

    respond_to do |format|
      format.html
    end
  end

  def new
    @movie = Movie.new

    respond_to do |format|
      format.html
    end
  end

  def create
    @movie = Movie.new(movie_params)

    saved = @movie.save

    respond_to do |format|
      if saved
        format.html { redirect_to movies_path, notice: "Movie \"#{@movie.title}\" created!" }
      else
        format.html { render action: 'new' }
        format.js
      end
    end
  end

  def edit
    @movie = Movie.find params[:id]

    respond_to do |format|
      format.html
    end
  end

  def update
    @movie = Movie.find params[:id]

    saved = @movie.update(movie_params)

    respond_to do |format|
      if saved
        format.html { redirect_to movies_path, notice: "Movie \"#{@movie.title}\" updated!" }
      else
        format.html { render action: 'edit' }
        format.js
      end
    end
  end

  def destroy
    @movie = Movie.find params[:id]

    @movie.destroy

    redirect_to movies_path, notice: "Movie \"#{@movie.title}\" removed!"
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :summary, :year, :genre, :imdb)
  end
end
