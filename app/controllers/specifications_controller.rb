class SpecificationsController < ApplicationController
  def new
    @specification = Specification.new(:property_id => params[:property_id])   
     @property =  params[:property_id]
  end
  
  def create
    @specification = Specification.new(params[:specification]) 
    
    respond_to do |format|
      if @specification.save
        format.html { redirect_to(new_amenity_path(:property_id => @specification.property_id), :notice => "Step 3: Add Amenities") }
        format.xml  { render :xml => @property, :status => :created, :location => @property }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @property.errors, :status => :unprocessable_entity }
      end
    end
  end  
  
  
  
  
  def edit
    @specification = Specification.find_by_property_id(params[:id])
  end
  
  def update
    @specification = Specification.find(params[:id])
    if @specification.update_attributes(params[:specification])
      flash[:notice] = "Successfully updated specification."
      redirect_to @specification.property
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @specification = Specification.find(params[:id])
    @specification.destroy
    flash[:notice] = "Successfully destroyed specification."
    redirect_to @specification.property
  end
end
