require_relative 'word_guess'

describe WordGuess do
	let(:secret) {WordGuess.new("hello")}

	it "converts number of words to '-'" do
		expect(secret.word_convert).to eq "-----"
	end

	it "replaces '-' with correct letter" do
		secret.word_convert
		expect(secret.guess("h")).to eq "h----"
	end

end