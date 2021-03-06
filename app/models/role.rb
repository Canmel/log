class Role < ApplicationRecord
  has_and_belongs_to_many :users, :join_table => :users_roles
  has_and_belongs_to_many :menus, :join_table => :roles_menus

  belongs_to :resource,
             :polymorphic => true,
             :optional => true

  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true

  scopify
  enum status: { active: 1, archived: 0 }
end
