@client_app
Feature: ClientChat
	In order to get manager's assistance faster
	As a client
	I want to have a chat option

@p1
Scenario: Chat feature can be turned on in Settings
	Given chat feature exists
	And user is authorized as client
	And administrator enabled chats in Settings
	Then chat icon is added to the client's account
	
@p1
Scenario: Chat feature can be turned off in Settings
	Given chat feature exists
    And user is authorized as client
	And administrator disabled chats in Settings
    Then there is no chat icon in client's account
	
@p1 @smoke_test
Scenario: Client can initiate the chat with manager
	Given chat feature is turned on in Settings
	And manager is online
	And user is authorized as client
	When I click on chat icon
	Then chat with manager is open
	
@p1
Scenario Outline: Chat can be initiated at any time
	Given chat feature is turned on in Settings
	And user is authorized as client
	When I click on chat icon at <time>
	Then chat with manager is open
Examples:
	| time  |
	| 12 AM |
	| 2 AM  |
	| 4 AM  |
	| 6 AM  |
	| 8 AM  |
	| 10 AM |
	| 12 PM |
	| 2 PM  |
	| 4 PM  |
	| 6 PM  |
	| 8 PM  |
	| 10 PM |
	
@p1
Scenario: Chat can be initiated with manager that is offline
	Given chat feature is turned on in Settings
	And manager is offline
	And user is authorized as client
	When I click on chat icon
	Then chat with manager is open
	
@p1
Scenario: Chat history is being saved
	Given chat feature is turned on in Settings
	And user is authorized as client
	When I click on chat icon
	And I send message
	And I close chat
	And I click on chat icon
	Then old messages are shown in chat

@p2
Scenario: Chat icon is located at the bottom right corner in client's account
	Given chat feature is turned on in Settings
	And user is authorized as client
	Then chat icon is located at the bottom right corner in client's account
	
@p2
Scenario: Chat includes identifier that shows if the manager is offline
	Given chat feature is turned on in Settings
	And manager is online
	And user is authorized as client
	When I click on chat icon
	Then chat with manager is open
	And client's indicator is shown as online
	And manager's indicator is shown as offline
