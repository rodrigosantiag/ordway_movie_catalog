class MoviesController < ApplicationController

  def index
    @movies = Movie.all.order(:title)

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
        flash[:success] = "Movie \"#{@movie.title}\" created!"
        format.html { redirect_to movies_path }
      else
        format.html { render action: 'new' }
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
        flash[:success] = "Movie \"#{@movie.title}\" updated!"
        format.html { redirect_to movies_path }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @movie = Movie.find params[:id]

    @movie.destroy

    flash[:success] = "Movie \"#{@movie.title}\" removed!"
    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :summary, :year, :genre, :imdb)
  end
end
