Rails.application.routes.draw do

get("/", {:controller =>"users", :action => "index"})
get("/users", {:controller =>"users", :action => "index"})
get("/users/:path_username", {:controller =>"users", :action => "show"})
get("/insert_user_record", {:controller => "users", :action => "create"})
get("/update_user/:modify_user_id", {:controller => "users", :action => "edit"})

get("/photos", {:controller =>"photos", :action => "index"})
get("/photos/:path_photo_id", {:controller =>"photos", :action => "show"})
get("/delete_photo/:path_photo_delete_id",{:controller => "photos", :action => "delete"})
get("/insert_photo_record", {:controller => "photos", :action => "create"})
get("/update_photo/:modify_photo_id", {:controller => "photos", :action => "edit"})
get("/insert_comment_record", {:controller => "photos", :action => "insert_comment"})

end