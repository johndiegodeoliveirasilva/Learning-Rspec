## Four Phases of Testing
# Setup - get the conditions correct for the test
# Exercise - perform the thing that you're testing
# Verification - verify tha the exercise did what you expected
# Teardown - undo any conditions that shouldn't persit post-test

include 'rspec/autorun'

describe "#promote_to_adim" do
  it "make a regular membership an admin membership" do
    # setup
    membership = Membership.new(admin: false)

    # exercise
    membership.promote_to_adim

    # verify
    expect(membership).to be_admin  

  end
end
