require 'rails_helper'

RSpec.describe Review do
  it 'has attributes' do
    review = Review.new(review_data)

    expect(review.author).to eq('tricksy')
    expect(review.content).to eq("Excellent movie. Best of the trilogy. Lovely music. Nolan is a genius. So is Heath Ledger.")
  end
end