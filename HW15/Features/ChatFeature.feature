Feature: Chat
	In order to communicate with the manager
	As a client
	I want to have a chat option

@p1
Scenario: Chat feature can be turned on in Settings
	Given chat feature exists
	And user is authorized as manager
	And Settings page is open
	When I click on the enable chats button
	Then there is a page with clients available for chat
	
@p1
Scenario: Chat feature can be turned off in Settings
	Given chat feature exists
    And user is authorized as manager
    And Settings page is open
    When I click on the disable chats button
    Then there is no page with clients available for chat
	
@p1 @smoke_test
Scenario: Client can initiate the chat with manager
	Given chat feature is turned on in Settings
	And manager is online
	And user is authorized as client
	When I open the chat
	And I send message
	Then manager gets pop-up notification with client's id
	
@p1 @smoke_test
Scenario: Manager has a page with clients available for chat
	Given chat feature is turned on in Settings
	And user is authorized as manager
	Then page with clients available for chat is added to the manager's account
	
@p1 @smoke_test
Scenario: Manager can initiate a chat with the client from the list of clients
	Given chat feature is turned on in Settings
	And user is authorized as manager
	And page with clients available for chat is open
	When I click on client
	Then chat with client is open
	
@p1 @smoke_test
Scenario: Manager gets pop-up notification with client's id once the client initiates the chat
	Given chat feature is turned on in Settings
	And manager is online
	And user is authorized as client
	When I open chat
	And I send message
	Then manager gets pop-up notification with client's id
	
@p1 @smoke_test
Scenario: Manager can open chat by clicking on client's id in the pop-up notification
	Given chat feature is turned on in Settings
	And user is authorized as manager
	And user started a chat
	And manager gets pop-up notification with client's id
	When I click on client's id in pop-up notification
	Then manager gets transferred to chat with client
	
@p1
Scenario Outline: Chat can be initiated at any time
	Given chat feature is turned on in Settings
	And manager is online
	And user is authorized as user
	And I open chat at <time>
	And I send message
	Then manager gets pop-up notification with client's id
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
Scenario: Chat can be initiated with client that is offline
	Given chat feature is turned on in Settings
	And client is offline
	And user is authorized as manager
	And manager is on page with clients available for chat
	When I click on offline client
	Then chat with client is open
@p1
Scenario: Chat can be initiated with manager that is offline
	Given chat feature is turned on in Settings
	And manager is offline
	And user is authorized as client
	When I click on chat
	Then chat with manager is open
	
@p1
Scenario: Chat history is being saved
	Given chat feature is turned on in Settings
	And user is authorized as client
	When I click on chat
	And I send message
	And I close chat
	And I click on chat
	Then old messages are shown in chat

@p2
Scenario: Chat icon is located at the bottom right corner in client's account
	Given chat feature is turned on in Settings
	And user is authorized as client
	Then chat icon is located at the bottom right corner in client's account
	
@p2
Scenario: Chat includes identifier that shows if the client and manager are online
	Given chat feature is turned on in Settings
	And manager is offline
	And user is authorized as client
	When I click on chat
	Then chat with manager is open
	And client's indicator is green
	And manager's indicator is grey
