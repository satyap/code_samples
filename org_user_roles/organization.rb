class Organization < ActiveRecord::Base
  belongs_to :parent, class_name: 'Organization'
  has_many :organizations
  has_many :roles
  has_many :users, through: :roles

  def admin?(user)
    has_role?('admin', user)
  end

  def user?(user)
    has_role?('user', user)
  end

  def denied?(user)
    has_role?('denied', user)
  end

  def has_role?(role_name, user)
    mine = users.merge(Role.send(role_name)).select('id').include? user
    parents = parent && parent.send("#{role_name}?", user)
    return mine || !!parents
  end
end
