@block @block_xp
Feature: A student is shown a notification popup when they level up
  In order to motivate students
  The system
  Notifies students when they level up

  Scenario: Notification for leveling up
    Given the following "users" exist:
      | username | firstname | lastname | email          |
      | s1       | Student   | One      | s1@example.com |
    And the following "courses" exist:
      | fullname  | shortname |
      | Course 1  | c1        |
    And the following "course enrolments" exist:
      | user     | course | role    |
      | s1       | c1     | student |
    And I log in as "admin"
    And I am on front page
    And I follow "Course 1"
    And I turn editing mode on
    And I add the "Level up!" block
    And I add a "Forum" to section "1" and I fill the form with:
      | Forum name  | Test forum name |
      | Forum type  | Standard forum for general use |
      | Description | Test forum description |
    And I log out
    When I log in as "s1"
    And I am on front page
    And I follow "Course 1"
    And I add a new discussion to "Test forum name" forum with:
      | Subject | Post with text    |
      | Message | This is the body  |
    And I reply "Post with text" post from "Test forum name" forum with:
      | Subject | Reply with text   |
      | Message | This is the body  |
    And I follow "Test forum name"
    And I follow "Post with text"
    And I follow "Edit"
    And I press "Save changes"
    And I am on front page
    And I follow "Course 1"
    Then I should see "You reached level 2!"
    And I click on "View the ladder" "link" in the "Level up!" "block"
    And the following should exist in the "generaltable" table:
      | Full name   | Level | Experience points |
      | Student One | 2     | 120               |
