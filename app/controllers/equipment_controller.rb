class EquipmentController < ApplicationController
  def index
    matching_equipment = Equipment.all

    @list_of_equipment = matching_equipment.order({ :created_at => :desc })

    render({ :template => "equipment/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_equipment = Equipment.where({ :id => the_id })

    @the_equipment = matching_equipment.at(0)

    render({ :template => "equipment/show.html.erb" })
  end

  def create
    the_equipment = Equipment.new
    the_equipment.home_id = params.fetch("query_home_id")
    the_equipment.description = params.fetch("query_description")

    if the_equipment.valid?
      the_equipment.save
      redirect_to("/equipment", { :notice => "Equipment created successfully." })
    else
      redirect_to("/equipment", { :notice => "Equipment failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_equipment = Equipment.where({ :id => the_id }).at(0)

    the_equipment.home_id = params.fetch("query_home_id")
    the_equipment.description = params.fetch("query_description")

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
