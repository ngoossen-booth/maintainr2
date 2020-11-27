class AboutController < ApplicationController
    # Uncomment this if you want to force users to sign in before any other actions
   skip_before_action(:force_user_sign_in, { :only => [:index})
  
  def index

    render({ :template => "about/index.html.erb" })
  end

end
