require 'rails_helper'

RSpec.describe StaffMember, type: :model do
  it { should have_many(:requests) }
end
