module UsersHelper
  def gravatar_for(user, size: 80)
    digest = Digest::MD5.hexdigest(user.email)
    url = "https://www.gravatar.com/avatar/#{digest}?s=#{size}"
    image_tag url, alt: "User's gravatar"
  end

end
