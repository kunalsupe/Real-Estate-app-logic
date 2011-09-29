class AmenitiesController < ApplicationController
  def new
    @amenities = Amenity.new(:property_id => params[:property_id])
  end
  
  def create
    @amenities = Amenity.new(params[:amenity]) 
    respond_to do |format| 
      
       if @amenities.save
        format.html { redirect_to(new_gallery_path(:property_id => @amenities.property_id), :notice => "Step 4: Add a Photo to Gallery") }
        format.xml  { render :xml => @property, :status => :created, :location => @property }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @property.errors, :status => :unprocessable_entity }
      
    end
    end
  end   
  
  
  
  def edit
    @amenities = Amenity.find_by_property_id(params[:id])
  end
  
  def update
    @amenities = Amenity.find(params[:id])
    if @amenities.update_attributes(params[:amenities])
      flash[:notice] = "Successfully updated amenities."
      redirect_to @amenities.property
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @amenities = Amenity.find(params[:id])
    @amenities.destroy
    flash[:notice] = "Successfully destroyed amenities."
    redirect_to @amenities.property
  end
end
