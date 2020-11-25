class ClothesController < ApplicationController
  def index
    #matching_clothes = Clothe.all
    #matching_household = params.fetch("path_id")
    matching_clothes = @current_user.clothes
    matching_households = @current_user.households

    @list_of_households = matching_households.order({ :created_at => :desc })


    @list_of_clothes = matching_clothes.order({ :created_at => :desc })

    render({ :template => "clothes/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_clothes = Clothe.where({ :id => the_id })

    @the_clothe = matching_clothes.at(0)

    render({ :template => "clothes/show.html.erb" })
  end

  def create
    the_clothe = Clothe.new
    home_nickname = params.fetch("query_home_nickname")
    matching_households = @current_user.households

    the_clothe.owner_id = @current_user.id
    the_clothe.description = params.fetch("query_description")
    the_clothe.home_id = matching_households.where({:nickname=>home_nickname}).at(0).id#params.fetch("query_home_id")
    the_clothe.quantity = params.fetch("query_quantity")


    if the_clothe.valid?
      the_clothe.save
      redirect_to("/clothes", { :notice => "Clothe created successfully." })
    else
      redirect_to("/clothes", { :notice => "Clothe failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_clothe = Clothe.where({ :id => the_id }).at(0)

    the_clothe.description = params.fetch("query_description")
    the_clothe.home_id = params.fetch("query_home_id")
    the_clothe.quantity = params.fetch("query_quantity")

    if the_clothe.valid?
      the_clothe.save
      redirect_to("/clothes/#{the_clothe.id}", { :notice => "Clothe updated successfully."} )
    else
      redirect_to("/clothes/#{the_clothe.id}", { :alert => "Clothe failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_clothe = Clothe.where({ :id => the_id }).at(0)

    the_clothe.destroy

    redirect_to("/clothes", { :notice => "Clothe deleted successfully."} )
  end
end
