class Organization < ActiveRecord::Base
  belongs_to :parent, class: Organization, foreign_key: :parent_organization_id
  has_many :children, class: Organization, foreign_key: :parent_organization_id
end
