require 'rails_helper'

RSpec.describe Answer, type: :model do
  it { should belong_to(:request) }
end
