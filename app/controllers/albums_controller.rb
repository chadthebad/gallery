class AlbumsController < ApplicationController

  def index
    @albums = Album.all
    index.html.erb
  end

  def show
    @album = Album.find(params[:id])
    show.html.erb
  end

  def new
    @album = Album.new
    new.html.erb
  end

  def edit
    @album = Album.find(params[:id])
  end

  def create
    @album = Album.new(params[:album])

    respond_to do |format|
      if @album.save
        redirect_to @album, notice: 'Album was successfully created.'
      else
        render action: "new"
      end
  end

  def update
    @album = Album.find(params[:id])

      if @album.update_attributes(params[:album])
        redirect_to @album, notice: 'Album was successfully updated.' 
      else
        render action: "edit" 
      end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to albums_url 
    end
end