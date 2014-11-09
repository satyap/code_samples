class User < ActiveRecord::Base
  has_many :organizations, through: :roles
  has_many :roles

  def create_role(name, org)
    Role.create(name: name, organization: org, user: self)
  end
end
