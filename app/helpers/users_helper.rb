module UsersHelper
    
    # Returns the Gravatar for the given user.
    def avatar_for(user, size)
        image_tag(user.avatar.url, alt: user.name, :height => size, :width => size)
    end
    
    def google_auth(user)
        user.google_auth
    end
end
