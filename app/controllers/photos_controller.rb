class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def create
    @photo = Photo.new(:title => params[:photo][:title])
    @photo.image = params[:photo][:image].read

      if @photo.save
        path = "#{Rails.root}/public/uploads/#{@photo.id}.jpg"
        File.open(path, "wb") { |f| f.write @photo.image }
        redirect_to @photo, notice: 'Photo was successfully created.'
      else
        render action: "new"
      end
  end

  def update
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
  end
end
