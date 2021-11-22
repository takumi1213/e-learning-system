module LessonsHelper
  def check_if_learned(category_id)
    return Lesson.where( category_id: category_id, user_id:current_user).exists?
  end
end

