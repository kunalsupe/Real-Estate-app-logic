class GalleriesController < ApplicationController
  def new
    @gallery = Gallery.new(:property_id => params[:property_id])   
   
  end
  
  def create
    @gallery = Gallery.new(params[:gallery]) 
    
    respond_to do |format|
      if @gallery.save
        format.html { redirect_to(new_floorplan_path(:property_id => @gallery.property_id), :notice => "Step 5: Add Floor Plan") }
        format.xml  { render :xml => @property, :status => :created, :location => @property }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @property.errors, :status => :unprocessable_entity }
      end
    end
  end  
  
  def edit
    @gallery = Gallery.find_by_property_id(params[:id])
  end
  
  def update
    @gallery = Gallery.find(params[:id])
    if @gallery.update_attributes(params[:gallery])
      flash[:notice] = "Successfully updated gallery."
      redirect_to @gallery.property
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    flash[:notice] = "Successfully destroyed photo from your gallery."
    redirect_to @gallery.property
  end
end
