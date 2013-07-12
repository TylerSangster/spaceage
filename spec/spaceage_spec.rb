require_relative '../spaceage'

describe Spaceage do

  planets = {
    earth: 31557600,
    venus: 19414199,
    mars: 59354116,
    jupiter: 374359999,
    saturn: 929292362,
    uranus: 2651370019,
    neptune: 5200418560
  }

  planets.each_pair do |key, value|
    it "converts seconds to #{key} years" do
       expect(value.send("to_#{key}_years".to_sym)).to be_within(0.1).of(1.0)
    end
  end

end

main_object = self

describe Question do

  it "answers the question from the exercise" do
    the_answer = main_object.my_age_in_seconds_is(1013000000).how_old_am_i?
    expect(the_answer).to eq 32
  end

  it "answers the bonus questions too" do
    the_answer = main_object.my_age_in_seconds_is(1013000000).how_old_am_i_on_venus?
    expect(the_answer).to be_within(0.2).of(52)
  end

end
