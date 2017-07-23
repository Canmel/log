module ApplicationHelper
  def all_role
    Role.all
  end

  def all_menus
    Menu.all
  end

  def load_menus(level, parent_id)
    Menu.find_by_user current_user.id, level, parent_id if current_user
  end
end
