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
    # If denied, stop right here and don't check further
    if has_role_with_me?('denied', user)
      return role_name=='denied' ? true : false
      # If 'denied' role is being checked, return true here.
      # If 'denied' role is not being checked, return false here.
      # Could just return the result of the comparison, but that would be more
      # confusing than returning the explicit values.
    end
    mine = has_role_with_me?(role_name, user)
    return mine || !!(parent && parent.send("#{role_name}?", user))
  end

  def has_role_with_me?(role_name, user)
    users.merge(Role.send(role_name)).select('id').include? user
  end
end
