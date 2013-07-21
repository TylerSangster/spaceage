# To use this program, load it in IRB and theh
# ask the questions from the Jumpstart labs exercise:
#
# load 'spaceage.rb'
#
# my_age_in_seconds_is(1013000000).how_old_am_i?
# => 32
# my_age_in_seconds_is(1013000000).how_old_am_i_on_venus?
# => 52.178439409192634


module Spaceage

  def to_earth_years
    (self / 31557600)
  end

  def to_venus_years
    self / (31557600 * 0.61519726)
  end

  def to_mars_years
    self / (31557600 * 1.8808158)
  end

  def to_jupiter_years
    self / (31557600 * 11.862615)
  end

  def to_saturn_years
    self / (31557600 * 29.447498)
  end

  def to_uranus_years
    self / (31557600 * 84.016846)
  end

  def to_neptune_years
    self / (31557600 * 164.79132)
  end

end

# insert our Spaceage module into the Fixnum class.
# these methods will now be available on EVERY integer now:
class Fixnum
  include Spaceage
end


module Question

  def my_age_in_seconds_is seconds
   @seconds = seconds
   self
  end

  def how_old_am_i?
    @seconds.to_earth_years
  end

  # All these methods are the same, so lets define them with a loop:
  ["venus", "mars", "jupiter", "saturn", "uranus", "neptune"].each do |planet|
    define_method("how_old_am_i_on_#{planet}?".to_sym) do
      @seconds.send "to_#{planet}_years"
    end
  end

end

# Insert the module into the main object.
# Extend makes the methods of the module end up as class methods

self.extend Question
