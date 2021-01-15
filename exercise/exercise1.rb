require "rspec/autorun"

# Use TDD principles to build out name functionality for a Person.
# Here are the requirements:
# - Add a method to return the full name as a string. A full name includes
#   first, middle, and last name. If the middle name is missing, there shouldn't
#   have extra spaces.
# - Add a method to return a full name with a middle initial. If the middle name
#   is missing, there shouldn't be extra spaces or a period.
# - Add a method to return all initials. If the middle name is missing, the
#   initials should only have two characters.
#
# We've already sketched out the spec descriptions for the #full_name. Try
# building the specs for that method, watch them fail, then write the code to
# make them pass. Then move on to the other two methods, but this time you'll
# create the descriptions to match the requirements above.

class Person
  def initialize(first_name, middle_name = nil, last_name)
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
  end

  def full_name
     @middle_name == nil ? "#{@first_name}#{@last_name}":  
    "#{@first_name} #{@middle_name} #{@last_name}" 
  end

  def middle_initial
    @middle_name == nil ? "#{@first_name}#{@last_name}": "#{@middle_name} #{@first_name} #{@last_name}"
  end

  def initial
    @middle_name == nil ? "#{@first_name[0]}#{@last_name[0]}": "#{@first_name[0]}#{@middle_name[0]}#{@last_name[0]}"
  end
end

RSpec.describe Person do
  describe "#full_name" do
    it "concatenates first name, middle name, and last name with spaces" do
      person = Person.new("John Diego", "de Oliveira", "Silva")
      expect(person.full_name).to eq("John Diego de Oliveira Silva")  
    end

    it "does not add extra spaces if middle name is missing" do
      person = Person.new("John Diego", nil , "Silva")
      expect(person.full_name).to  eq("John DiegoSilva")
    end
  end

  describe "#full_name_with_initial" do
    it "concate middle name, first name and last name with spaces" do
      person = Person.new("John", "Diego", "Silva")
      expect(person.middle_initial).to eq("Diego John Silva") 
    end
    it "does not add extra spaces if middle name is missing or a perid" do
      person = Person.new("John", nil, "Silva")
      expect(person.middle_initial).to eq("JohnSilva") 
    end
  end
 
  describe "#initials" do
    it "return full name with a middle initial" do
      person = Person.new("John", "Diego", "Silva")
      expect(person.initial).to eq("JDS")  
    end
    it "return only two caracteres" do
      person = Person.new("John", nil, "Silva")
      expect(person.initial).to eq("JS")  
    end
  end
end