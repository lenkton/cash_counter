require 'rails_helper'

RSpec.describe ProcurementLot, type: :model do
  it { should validate_presence_of(:title) }
end
