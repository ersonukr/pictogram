module ApplicationHelper
  def alert_for(flash_type)
    {success: 'alert-success',
     error: 'alert-danger',
     alert: 'alert-warning',
     notice: 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def form_image_select(article)
    return image_tag article.image.url(:medium), id: 'image-preview', class: 'img-responsive' if article.image.exists?
    image_tag 'placeholder.jpg', id: 'image-preview', class: 'img-responsive'
  end

  def profile_avatar_select(user)
    return image_tag user.avatar.url(:medium), id: 'image-preview', class: 'img-responsive img-circle profile-image' if user.avatar.exists?
    image_tag 'default-avatar.jpg', id: 'image-preview', class: 'img-responsive img-circle profile-image'
  end
end
