class ComponentsController < ApplicationController
  def index
    matching_components = Component.all

    @list_of_components = matching_components.order({ :created_at => :desc })

    render({ :template => "components/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_components = Component.where({ :id => the_id })

    @the_component = matching_components.at(0)

    render({ :template => "components/show.html.erb" })
  end

  def create
    the_component = Component.new
    the_component.equipment_id = params.fetch("query_equipment_id")
    the_component.last_service_date = params.fetch("query_last_service_date")
    the_component.next_service_date = params.fetch("query_next_service_date")
    the_component.description = params.fetch("query_description")

    if the_component.valid?
      the_component.save
      redirect_to("/components", { :notice => "Component created successfully." })
    else
      redirect_to("/components", { :notice => "Component failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_component = Component.where({ :id => the_id }).at(0)

    the_component.equipment_id = params.fetch("query_equipment_id")
    the_component.last_service_date = params.fetch("query_last_service_date")
    the_component.next_service_date = params.fetch("query_next_service_date")
    the_component.description = params.fetch("query_description")

    if the_component.valid?
      the_component.save
      redirect_to("/components/#{the_component.id}", { :notice => "Component updated successfully."} )
    else
      redirect_to("/components/#{the_component.id}", { :alert => "Component failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_component = Component.where({ :id => the_id }).at(0)

    the_component.destroy

    redirect_to("/components", { :notice => "Component deleted successfully."} )
  end
end
