module ApplicationHelper
  
  def full_title(page_title)
    title = "Anonumos"
    base_title = "#{title} - The best fully anonymous messaging platform you will ever find."
    page_title.empty? ? base_title : "#{title} - #{page_title}"
  end
  
  # Returns the gravatar for the given user
  def gravatar_for(user, size: 80)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: current_user.email + " gravatar", width: 130, height: 80, 
                            class: "img-responsive img-rounded")
  end
end
