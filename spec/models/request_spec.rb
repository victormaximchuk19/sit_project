require 'rails_helper'

RSpec.describe Request, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:staff_member) }
end
