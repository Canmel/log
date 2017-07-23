module MenusHelper
  def parents_menus
    Menu.where( resource_type: Menu.resource_types[:one_level], status: Menu.statuses[:active] )
  end
end
