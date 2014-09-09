module ApplicationHelper

  def name_of(user)
    if user.first_name
      if user.last_name
        return user.first_name + ' ' + user.last_name
      else
        return user.first_name
      end
    else
      return user.email
    end
  end
end
