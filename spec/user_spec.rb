require 'active_record_spec_helper'
require 'models/user'

describe User do
  def three_times(klass)
    3.times do
      klass.create
    end
  end

  class UserWithError < User
    at_most(3, { message: "KHAAAN" })
  end

  class Book < User; end

  describe 'at_most(3)' do
    it 'should not fail when under the user limit' do
      User.create.should be_valid
    end

    it 'should make objects up to the limit without failing' do
      lambda { three_times(User) }.should_not raise_error
    end

    it 'should fail on the fourth creation' do
      three_times(User)
      User.create.should_not be_valid
    end

    it 'should accept a custom error in the method' do
      three_times(UserWithError)
      # en.activerecord.errors.models.users.at_most
      UserWithError.create.errors.inspect.should include("KHAAAN")
    end

    it 'should prefer a specific i18n option' do
      three_times(Book)
      # en.at_most
      Book.create.errors.inspect.should include("Fallback")
    end
  end
end
