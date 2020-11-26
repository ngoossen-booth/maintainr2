Rails.application.routes.draw do

get("/", { :controller => "households", :action => "index" })

  # Routes for the Clothe resource:

  # CREATE
  post("/insert_clothe", { :controller => "clothes", :action => "create" })
          
  # READ
  get("/clothes", { :controller => "clothes", :action => "index" })
  
  get("/clothes/:path_id", { :controller => "clothes", :action => "show" })
  
  # UPDATE
  
  post("/modify_clothe/:path_id", { :controller => "clothes", :action => "update" })
  
  # DELETE
  get("/delete_clothe/:path_id", { :controller => "clothes", :action => "destroy" })

  #------------------------------

  # Routes for the Household resource:

  # CREATE
  post("/insert_household", { :controller => "households", :action => "create" })
          
  # READ
  get("/households", { :controller => "households", :action => "index" })
  
  get("/households/:path_id", { :controller => "households", :action => "show" })

  # UPDATE
  
  post("/modify_household/:path_id", { :controller => "households", :action => "update" })
  
  # DELETE
  get("/delete_household/:path_id", { :controller => "households", :action => "destroy" })

  #------------------------------

  # Routes for the Component resource:

  # CREATE
  post("/insert_component", { :controller => "components", :action => "create" })
          
  # READ
  get("/components", { :controller => "components", :action => "index" })
  
  get("/components/:path_id", { :controller => "components", :action => "show" })
  
  # UPDATE
  
  post("/modify_component/:path_id", { :controller => "components", :action => "update" })
  
  # DELETE
  get("/delete_component/:path_id", { :controller => "components", :action => "destroy" })

  #------------------------------

  # Routes for the Equipment resource:

  # CREATE
  post("/insert_equipment", { :controller => "equipment", :action => "create" })
          
  # READ
  get("/equipment", { :controller => "equipment", :action => "index" })
  
  get("/equipment/:path_id", { :controller => "equipment", :action => "show" })
  
  # UPDATE
  
  post("/modify_equipment/:path_id", { :controller => "equipment", :action => "update" })
  
  # DELETE
  get("/delete_equipment/:path_id", { :controller => "equipment", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
