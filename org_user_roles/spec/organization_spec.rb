require 'spec_helper'

describe Organization do

  let(:root) { build :organization }
  let(:org_1) { build :organization, parent: root }
  let(:org_2) { build :organization, parent: root }
  let(:org_3) { build :organization, parent: root }
  let(:org_1_1) { build :organization, parent: org_1 }
  let(:org_1_2) { build :organization, parent: org_1 }
  let(:org_3_1) { build :organization, parent: org_3 }
  let(:org_3_2) { build :organization, parent: org_3 }

  let(:user1) { build :user }
  let(:user2) { build :user }

  before do
    user1.create_role('admin', org_1)
    user1.create_role('user', org_2)
    user1.create_role('user', org_3)
    user1.create_role('denied', org_1_2)

    user2.create_role('admin', root)
    user2.create_role('denied', org_3)
    user2.create_role('admin', org_3_1)
    user2.create_role('user', org_3_1)
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

  describe 'child organizations' do
    it 'should inherit parent roles' do
      expect( org_1_1.admin? user1 ).to be true
      expect( org_3_1.user? user1 ).to be true
      expect( org_1_1.user? user1 ).to be false
    end

    it 'should inherit root org roles' do
      expect( org_1_1.admin? user2 ).to be true
    end

    context 'when parent has permission but current org is denied' do
      it 'should deny access' do
        expect( org_1_2.user? user1 ).to be false
      end
    end

    context 'when parent org is denied but current org has permission' do
      it 'should deny access' do
        expect( org_3_1.user? user2 ).to be false
        expect( org_3_1.admin? user2 ).to be false
      end
    end
  end
end
