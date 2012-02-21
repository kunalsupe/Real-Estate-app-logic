class PropertiesController < ApplicationController
    
    def index
    #  @property= Property.find(:all)    
       @properties= Property.search(params[:search]).paginate(:per_page => 8, :page => params[:page])
        @mycounter = showmypropertycount
        @counter = showallpropertycount 
       @mailcounter = Contact.count(:all)  
       
   # @ratingsp = Rating.find(:all) 

  
  #    @ratings = Rating.average(:rate, :conditions => ['property_id =?', params[:id]]) 

     #  @rates = @ratings.rate
      #  @avgrate = @rates.inject{ |sum,el| sum + el }.to_f / @ratings.size 
        
        if current_user
          a = current_user  

          @user = current_user 
          else
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @properties} 
        format.pdf  { render :layout => false }  
      end
      end
    end    
    
    def sale 
      @properties= Property.search(params[:search]).paginate(:per_page => 10, :page => params[:page])            
      @sale = Property.find(:all, :conditions => [ "cat_id = ?", 1]).paginate(:per_page => 4, :page => params[:page])       
       @user = current_user
    end
    
    def rent 
      @properties= Property.search(params[:search]).paginate(:per_page => 10, :page => params[:page])            
      @rent =  Property.find(:all, :conditions => [ "cat_id = ?", 2]).paginate(:per_page => 4, :page => params[:page])           
       @user = current_user 
    end 
       
      def featured 
        @properties= Property.search(params[:search]).paginate(:per_page => 10, :page => params[:page])            
        @featured =  Property.find(:all, :conditions => [ "featured = ?", 1]).paginate(:per_page => 4, :page => params[:page])           
         @user = current_user 
      end  
      
      def sold
         @properties= Property.search(params[:search]).paginate(:per_page => 10, :page => params[:page])            
        @sold =  Property.find(:all, :conditions => [ "sold = ?", 1]).paginate(:per_page => 4, :page => params[:page])           
         @user = current_user
      end
      
  

         def calender
              @properties= Property.find(:all)  
              @mycounter = showmypropertycount
              @counter = showallpropertycount
             @date = params[:month] ? Date.parse(params[:month]) : Date.today  

           end  

    def showmyproperty 
      @mycounter = showmypropertycount
      @counter = showallpropertycount
      @property = Property.all
      
        if current_user
           @a = current_user.id  
            @b = Property.where(:builder_id => @a)
           @count = Property.count(:all, :conditions => [ "builder_id = ?", @a])  
         
          @user = current_user 
          else
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @properties} 
        format.pdf  { render :layout => false }  
      end
      end
    end

    # GET /propertys/1
    # GET /propertys/1.xml
    def show     
        @mycounter = showmypropertycount
         @counter = showallpropertycount
       @property = Property.find(params[:id])  
       @specification = Specification.find_by_property_id(params[:id])  
       @amenities = Amenity.find_by_property_id(params[:id]) 
       @galleries = Gallery.find_all_by_property_id(params[:id], :conditions => "photo_file_name IS NOT NULL")
       
       @gallery = Gallery.find_by_property_id(params[:id]) 
       @floorplans = Floorplan.find_all_by_property_id(params[:id], :conditions => "photo_file_name IS NOT NULL")
       @floorplan = Floorplan.find_by_property_id(params[:id]) 
      
      @ratings = Rating.average(:rate, :conditions => ['property_id =?', params[:id]]) 
      
      if current_user
      # @a = current_user.id    
       # @b = @property.author_id


        @user = current_user 
        else 
       respond_to do |format|

           format.html # index.html.erb
          format.xml  { render :xml => @property } 
          format.pdf { render :layout => false }  
         end
        end
    end      



    # GET /propertys/new
    # GET /propertys/new.xml
    def new    
       @mycounter = showmypropertycount
        @counter = showallpropertycount
      @property = Property.new     
      @authentication = Authentication.all 
      
      if current_user

       a = current_user
       @user = User.find(a)   
       
     else   
       redirect_to authentications_path  

    end
    end

    # GET /propertys/1/edit
    def edit 
      @mycounter = showmypropertycount
      @counter = showallpropertycount
      @property = Property.find(params[:id])  
      a = current_user
       @user = User.find(a)
    end

    # POST /propertys
    # POST /propertys.xml
    def create
      @property = Property.new(params[:property])
        if current_user

         a = current_user
         @user = User.find(a)
         end        
      respond_to do |format|
        if @property.save
          format.html { redirect_to(new_specification_path(:property_id => @property), :notice => 'Step 2: Add Property Specifications') }
          format.xml  { render :xml => @property, :status => :created, :location => @property }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @property.errors, :status => :unprocessable_entity }
        end
      end
    end

    # PUT /propertys/1
    # PUT /propertys/1.xml
    def update    
       @mycounter = showmypropertycount
       @counter = showallpropertycount
      @property = Property.find(params[:id])
           
      respond_to do |format|
        if @property.update_attributes(params[:property])
          format.html { redirect_to(@property, :notice => 'Property was successfully updated.') }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @property.errors, :status => :unprocessable_entity }
        end
      end
    end

    # DELETE /propertys/1
    # DELETE /propertys/1.xml
    def destroy   
      
      @mycounter = showmypropertycount
     @counter = showallpropertycount
     
      @property = Property.find(params[:id]) 
       @specification = Specification.find_by_property_id(params[:id])  
       @amenities = Amenity.find_by_property_id(params[:id]) 
       @galleries = Gallery.find_by_property_id(params[:id]) 
       @floorplans = Floorplan.find_by_property_id(params[:id])
        
       @property.destroy 
       @specification.destroy 
       @amenities.destroy  
        @galleries.destroy  
        @floorplans.destroy
       

      respond_to do |format|
        format.html { redirect_to(properties_url) }
        format.xml  { head :ok }
      end
    end
  end
 