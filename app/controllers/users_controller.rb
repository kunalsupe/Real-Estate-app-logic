class UsersController < ApplicationController  
  before_filter :authenticate_user! 
  before_filter do 
      redirect_to root_path unless current_user && current_user.admin?
    end
  
 # before_filter :get_user, :only => [:index,:new,:edit]
 # before_filter :accessible_roles, :only => [:new, :edit, :show, :update, :create]
  # load_and_authorize_resource :only => [:show,:new,:destroy,:edit,:update]
 
  # GET /users
  # GET /users.xml                                                
  # GET /users.json                                       HTML and AJAX
  #-----------------------------------------------------------------------
  
  def index                                  
     @a = Authentication.all 
    @users = User.find(:all)
    respond_to do |format|
      format.json { render :json => @users }
      format.xml  { render :xml => @users }
      format.html
    end
  end
 
  # GET /users/new
  # GET /users/new.xml                                            
  # GET /users/new.json                                    HTML AND AJAX
  #-------------------------------------------------------------------
  def new
    respond_to do |format|
      format.json { render :json => @user }   
      format.xml  { render :xml => @user }
      format.html
    end
  end
 
  # GET /users/1
  # GET /users/1.xml                                                       
  # GET /users/1.json                                     HTML AND AJAX
  #-------------------------------------------------------------------
  def show
      @user = User.find(params[:id])
       
           @a = @user.id 
            @b = Property.where(:builder_id => @a)
           
    end
 
  
  # GET /users/1/edit                                                      
  # GET /users/1/edit.xml                                                      
  # GET /users/1/edit.json                                HTML AND AJAX
  #-------------------------------------------------------------------
  def edit
  @user = User.find(params[:id])
  end
 
  # DELETE /users/1     
  # DELETE /users/1.xml
  # DELETE /users/1.json                                  HTML AND AJAX
  #-------------------------------------------------------------------
  def destroy                  
    @authentication = current_user.authentications.find_by_user_id(params[:id])
    @authentication.destroy 
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Successfully destroyed User."
    redirect_to users_url
  end        
  
  
    
 
 
  # POST /users
  # POST /users.xml         
  # POST /users.json                                      HTML AND AJAX
  #-----------------------------------------------------------------
  def create
    @user = User.new(params[:user])
 
    if @user.save
      respond_to do |format|
        format.json { render :json => @user.to_json, :status => 200 }
        format.xml  { head :ok }
        format.html { redirect_to :action => :index }
      end
    else
      respond_to do |format|
        format.json { render :text => "Could not create user", :status => :unprocessable_entity } # placeholder
        format.xml  { head :ok }
        format.html { render :action => :new, :status => :unprocessable_entity }
      end
    end
  end

end