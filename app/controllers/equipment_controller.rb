class EquipmentController < ApplicationController
  def index
    matching_equipment = @current_user.equipment
    matching_households = @current_user.households
    @list_of_households = matching_households.order({ :created_at => :desc })
    @list_of_equipment = matching_equipment.order({ :created_at => :desc })

    render({ :template => "equipment/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    matching_households = @current_user.households
    @list_of_households = matching_households.order({ :created_at => :desc })
    
    
    matching_equipment = Equipment.where({ :id => the_id })
    @the_equipment = matching_equipment.at(0)

    matching_components = Component.where({:equipment_id => the_id})
    @list_of_components = matching_components.order({ :next_service_date => :asc })

    render({ :template => "equipment/show.html.erb" })
  end

  def create
    the_equipment = Equipment.new
    home_nickname = params.fetch("query_home_nickname")
    matching_households = @current_user.households
    the_equipment.owner_id = @current_user.id
    the_equipment.description = params.fetch("query_description")
    the_equipment.home_id = matching_households.where({:nickname=>home_nickname}).at(0).id #params.fetch("query_home_id")
    

    if the_equipment.valid?
      the_equipment.save
      redirect_to("/equipment", { :notice => "Equipment created successfully." })
    else
      redirect_to("/equipment", { :alert => "Equipment failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_equipment = Equipment.where({ :id => the_id }).at(0)
    home_nickname = params.fetch("query_home_nickname")
    matching_households = @current_user.households
    the_equipment.owner_id = @current_user.id
    the_equipment.description = params.fetch("query_description")
    the_equipment.home_id = matching_households.where({:nickname=>home_nickname}).at(0).id
    # the_equipment.home_id = params.fetch("query_home_id")
    # the_equipment.description = params.fetch("query_description")

    if the_equipment.valid?
      the_equipment.save
      redirect_to("/equipment/#{the_equipment.id}", { :notice => "Equipment updated successfully."} )
    else
      redirect_to("/equipment/#{the_equipment.id}", { :alert => "Equipment failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_equipment = Equipment.where({ :id => the_id }).at(0)

    the_equipment.destroy

    redirect_to("/equipment", { :notice => "Equipment deleted successfully."} )
  end
end
