class PhotosController < ApplicationController

    def index
        matching_photos = Photo.all
        @list_of_photos = matching_photos.order({:created_at => :desc})
        render({ :template => "photo_templates/index.html.erb"})
    end

    def show
        url_photo_id = params.fetch("path_photo_id")
        matching_photos = Photo.where({ :id => url_photo_id})
        @the_photo = matching_photos.at(0)
        
        render({ :template => "photo_templates/show.html.erb"})
    end

    def delete
        url_photo_delete_id = params.fetch("path_photo_delete_id")
        matching_photos = Photo.where({ :id => url_photo_delete_id})
        the_photo = matching_photos.at(0)
        the_photo.destroy
        redirect_to("/photos")
    end

    def create
        input_image = params.fetch("input_image")
        input_caption = params.fetch("input_caption")
        input_user_id = params.fetch("input_owner_id")

        a_new_photo = Photo.new
        a_new_photo.image = input_image
        a_new_photo.caption = input_caption
        a_new_photo.owner_id = input_user_id
        a_new_photo.save

        redirect_to("/photos/"+a_new_photo.id.to_s)
    end

    def edit
        input_image = params.fetch("input_image")
        input_caption = params.fetch("input_caption")
        input_photo_id = params.fetch("modify_photo_id")

        a_update_photo = Photo.where({:id => input_photo_id}).at(0)
        a_update_photo.image = input_image
        a_update_photo.caption = input_caption
        a_update_photo.save

        redirect_to("/photos/"+a_update_photo.id.to_s)
    end

    def insert_comment
        input_photo_id = params.fetch("input_photo_id")
        input_owner_id = params.fetch("input_author_id")
        input_comment = params.fetch("input_body")

        a_new_comment = Comment.new
        a_new_comment.photo_id = input_photo_id
        a_new_comment.author_id = input_owner_id
        a_new_comment.body = input_comment
        a_new_comment.save

        redirect_to("/photos/"+input_photo_id.to_s)
    end
end