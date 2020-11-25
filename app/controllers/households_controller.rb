class HouseholdsController < ApplicationController
  def index
    # matching_households = Household.all
    matching_households = @current_user.households

    @list_of_households = matching_households.order({ :created_at => :desc })

    render({ :template => "households/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_households = Household.where({ :id => the_id })

    @the_household = matching_households.at(0)

    render({ :template => "households/show.html.erb" })
  end

  def create
    the_household = Household.new
    the_household.owner_id = params.fetch("query_owner_id")
    the_household.picture = params.fetch("query_picture")
    the_household.nickname = params.fetch("query_nickname")

    if the_household.valid?
      the_household.save
      redirect_to("/households", { :notice => "Household created successfully." })
    else
      redirect_to("/households", { :notice => "Household failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_household = Household.where({ :id => the_id }).at(0)

    the_household.owner_id = params.fetch("query_owner_id")
    the_household.picture = params.fetch("query_picture")
    the_household.nickname = params.fetch("query_nickname")

    if the_household.valid?
      the_household.save
      redirect_to("/households/#{the_household.id}", { :notice => "Household updated successfully."} )
    else
      redirect_to("/households/#{the_household.id}", { :alert => "Household failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_household = Household.where({ :id => the_id }).at(0)

    the_household.destroy

    redirect_to("/households", { :notice => "Household deleted successfully."} )
  end
end
