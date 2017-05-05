module ApplicationHelper
    def gravatar_for(message, opts = {})
        #binding.pry
        user = message.user
        opts[:alt] = user.name

        if user.id == message.chat_room.mentor_id
            image_tag "1.png", opts
        else
            image_tag "2.png", opts
        end
    end
end
