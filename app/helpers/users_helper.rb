module UsersHelper
  def find_user_by_id user_id
    user = User.find_by id: user_id
    return user if user

    flash[:warning] = t "users.user_not_found"
    redirect_to root_path
  end

  def get_avatar_url user
    return "avatar_example.png" unless user.picture

    user.picture_url
  end

  def can_delete_review? review
    current_user.admin? || current_user.id == review.user_id
  end

  def can_update_review? review
    current_user.id == review.user_id
  end
end
