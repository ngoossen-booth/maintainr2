class AboutController < ApplicationController
  def index

    render({ :template => "about/index.html.erb" })
  end

end
