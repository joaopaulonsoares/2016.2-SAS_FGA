Feature: EditUser

Background:
	Given I register the user "lucas@gmail.com" with the password "123456"

Scenario: User registered
	When I visit site page "/"
	Then I should see an element with id of "enter-button"
	Then I click on an element with id of "enter-button"
	And I fill in "Email" with "lucas@gmail.com"
	And I fill in "Password" with "123456"
	Then I press "Entrar"
	Then I click on an element with id of "user-link"
	Then I click on an element with id of "edituser"
	And I fill in "Name" with "Pedro Pereira Pinto"
	And I press "Salvar Dados"

Scenario: User empties one field
	When I visit site page "/"
	Then I should see an element with id of "enter-button"
	Then I click on an element with id of "enter-button"
	And I fill in "Email" with "lucas@gmail.com"
	And I fill in "Password" with "123456"
	Then I press "Entrar"
	Then I click on an element with id of "user-link"
	Then I click on an element with id of "edituser"
	And I fill in "Email" with ""
	And I press "Salvar Dados"
	Then I should see an alert with text "Please fill out this field."
