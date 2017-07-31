module FlickrHelper
  def user_photos(user_id, photo_count = 4)
     photos = flickr.photos.search(user_id: user_id) 
  end

  def render_flickr_sidebar_widget(user_id, photo_count = 4, columns = 2)
    begin
        photos = user_photos(user_id, photo_count)
        render :partial => '/static_pages/sidebar_widget', :locals => { :photos => photos }
    rescue Exception
        render :partial => '/static_pages/unavailable'
    end
  end 
end