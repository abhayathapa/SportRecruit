module ApplicationHelper
  def avatar_url(person)
    if person.avatar_url.present?
      table-list.avatar_url
    else
      default_url = "#{root_url}images/pic1.jpg"
      gravatar_id = Digest::MD5.hexdigest(table-list.email.downcase)
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=#{CGI.escape(default_url)}"
    end
  end

end
