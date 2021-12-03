require 'rails_helper'

RSpec.describe Actor do
  it 'has attributes' do
    actor = Actor.new(actor_data)

    expect(actor.name).to eq("Christian Bale")
    expect(actor.character).to eq('Bruce Wayne / Batman')
  end
end