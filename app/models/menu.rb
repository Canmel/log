class Menu < ApplicationRecord
  has_and_belongs_to_many :menus, :join_table => :roles_menus
  has_and_belongs_to_many :roles, :join_table => :roles_menus
  belongs_to :parent, :class_name => 'Menu', foreign_key: 'parent_id', primary_key: 'id'

  delegate :name, to: :parent, prefix: true, allow_nil: true

  enum resource_type: { one_level: '1', two_level: '2' }
  enum resource_type: { one: 1, two: 2 }
  enum status: { active: 1, archived: 0 }


  class << self
    def find_by_user(user_id, level, parent_id)
      user = User.find(user_id)
      roles = user.roles
      menus = []
      roles.each do |role|
        if level == Menu.resource_types[:one]
          role_menus = role.menus.where(resource_type: level, status: Menu.active)
        else
          role_menus = role.menus.where(resource_type: level, parent_id: parent_id, status: Menu.active)
        end
        role_menus.each do |menu|
          menus << menu
        end
      end
      p menus
      menus.uniq
    end
  end
end