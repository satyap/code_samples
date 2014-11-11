class Organization < ActiveRecord::Base
  belongs_to :parent, class_name: 'Organization'
  has_many :organizations
  has_many :roles
  has_many :users, through: :roles

  def admin?(user)
    has_role?('admin', user) && !denied?(user)
  end

  def user?(user)
    has_role?('user', user) && !denied?(user)
  end

  def denied?(user)
    has_role?('denied', user)
  end

  private
  def has_role?(role_name, user)
    # Not checking for denied role explicitly. If that isn't a common case,
    # it'll lead to more SQL queries.
    mine = has_role_with_me?(role_name, user)
    return mine || !!(parent && parent.send("#{role_name}?", user))
  end

  def has_role_with_me?(role_name, user)
    users.merge(Role.send(role_name)).select('id').include? user
  end
end
