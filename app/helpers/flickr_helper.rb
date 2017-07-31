module FlickrHelper
  def user_photos(user_id, photo_count = 4)
     photos = flickr.photos.search(user_id: user_id) 
  end

  def render_flickr_sidebar_widget(user_id, photo_count = 4, columns = 2)
    begin
        photos = user_photoes(user_id, photo_count).in_groups_of(2)
        render :partial => '/flickr/sidebar_widget', :locals => { :photos => photos }
    rescue Exception
        render :partial => '/flickr/unavailable'
    end
  end 
end