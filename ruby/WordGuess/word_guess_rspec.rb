require_relative 'word_guess'

describe WordGuess do
	let(:word) {WordGuess.new("hello")}

	it "counts length of word" do
		expect(word.word_length("hello")).to eq 5
	end


end