require 'net/http'
require 'uri'
require 'lib/railsutils/instagram_utils'
require 'instagram'

class PhotosController < ApplicationController
  # GET /photos
  # GET /photos.json
  def index
    redirect_to :controller => 'sessions', :action => 'connect' if !session[:access_token] 
     
    @authorization_url = InstagramUtils::AUTHORIZATION_URL
    
    @photos = Photo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @photos }
    end
    # if params.has_key?(:code) 
    #       @response = InstagramUtils.get_access_token(params[:code])    
    #       puts "+++++++++++++++++", response.body, response.code, response.message # , response.headers.inspect
    #       
    #       # Instagram.configure do |config|
    #       #         config.client_id = "YOUR_CLIENT_ID"
    #       #         config.client_secret = "YOUR_CLIENT_SECRET"
    #       #       end
    #       #       
    #       #       response = Instagram.get_access_token(params[:code], :redirect_uri => InstagramUtils::REDIRECT_URI)
    #     elsif
    #       @authorization_url = InstagramUtils::AUTHORIZATION_URL
    # 
    #       @photos = Photo.all
    # 
    #       respond_to do |format|
    #         format.html # index.html.erb
    #         format.json { render :json => @photos }
    #       end
    
    
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
    @photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(params[:photo])

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, :notice => 'Photo was successfully created.' }
        format.json { render :json => @photo, :status => :created, :location => @photo }
      else
        format.html { render :action => "new" }
        format.json { render :json => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to @photo, :notice => 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end
end
