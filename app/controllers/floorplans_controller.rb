class FloorplansController < ApplicationController
  def new
    @floor_plan = Floorplan.new(:property_id => params[:property_id])   
    
  end
  
  def create
    @floor_plan = Floorplan.new(params[:floorplan]) 
    
    respond_to do |format|
      if @floor_plan.save
        format.html { redirect_to 'properties_path',  :notice => "You have successfully Listed your Property." }
        format.xml  { render :xml => @property, :status => :created, :location => @property }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @property.errors, :status => :unprocessable_entity }
      end
    end
  end  
  
  def edit
    @floor_plan = Floorplan.find_by_property_id(params[:id])
  end
  
  def update
    @floor_plan = Floorplan.find(params[:id])
    if @floor_plan.update_attributes(params[:floor_plan])
      flash[:notice] = "Successfully updated floor_plan."
      redirect_to @floor_plan.property
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @floor_plan = Floorplan.find(params[:id])
    @floor_plan.destroy
    flash[:notice] = "Successfully destroyed floor plan."
    redirect_to @floor_plan.property
  end
end
