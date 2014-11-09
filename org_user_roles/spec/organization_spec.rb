require 'spec_helper'

describe Organization do

  let(:root) { build :organization }
  let(:org_1) { build :organization, parent: root }
  let(:org_2) { build :organization, parent: root }
  let(:org_3) { build :organization, parent: root }
  let(:child_org_1) { build :organization, parent: org_1 }
  let(:child_org_2) { build :organization, parent: org_1 }
  let(:child_org_3) { build :organization, parent: org_3 }
  let(:child_org_4) { build :organization, parent: org_3 }

  let(:user1) { build :user }
  let(:user2) { build :user }

  before do
    user1.create_role('admin', org_1)
    user2.create_role('admin', root)
    user1.create_role('user', org_2)
    user1.create_role('denied', child_org_2)
  end

  describe 'root organization' do
    it 'should have permissions of its own users only' do
      expect( root.admin?(user1) ).to be false
      expect( root.admin?(user2) ).to be true
    end
  end

  describe '2nd level organization' do
    it 'should inherit parent roles' do
      expect( org_1.admin?(user2) ).to be true
      expect( org_2.admin?(user1) ).to be false
    end
  end

  describe 'child prganizations' do
    it 'should inherit parent roles'

    it 'should inherit root org roles'
  end
end
