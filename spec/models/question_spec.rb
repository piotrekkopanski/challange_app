require 'rails_helper'
describe Question do
  describe 'validations' do
    it { should validate_presence_of :title }
  end
end
