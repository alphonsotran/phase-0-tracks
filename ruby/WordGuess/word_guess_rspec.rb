require_relative 'word_guess'

describe WordGuess do
	let(:word) {WordGuess.new("hello")}

	it "converts number of words to '-'" do
		expect(word.word_convert).to eq "-----"
	end

	it "replaces '-' with correct letter" do
		word.word_convert
		expect(word.guess("h")).to eq "h----"
	end

end