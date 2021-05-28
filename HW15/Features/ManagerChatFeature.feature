@manager_app
Feature: ManagerChatFeature
In order to have more communication ways with the client
As a manager
I want to have a chat option

	@p1
	Scenario: Chat feature can be turned on in Settings
		Given chat feature exists
		And user is authorized as manager
		And administrator enabled chats in Settings
		When I click on tab with clients available for chat
		Then page with clients available for chat is open
	
	@p1
	Scenario: Chat feature can be turned off in Settings
		Given chat feature exists
		And user is authorized as manager
		And administrator disabled chats in Settings
		When I click on tab with clients available for chat
		Then error 403 page is open
		
	@p1 @smoke_test
	Scenario: Manager has a page with clients available for chat
		Given chat feature is turned on in Settings
		And user is authorized as manager
		When I click on tab with clients available for chat
		Then page with clients available for chat is open
	
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
    Scenario: Chat can be initiated with client that is offline
    	Given chat feature is turned on in Settings
    	And client is offline
    	And user is authorized as manager
    	And manager is on page with clients available for chat
    	When I click on offline client
    	Then chat with client is open
    	
	Scenario Outline: Chat can be initiated at any time
		Given chat feature is turned on in Settings
		And user is authorized as manager
		And page with clients available for chat is open
		When I click on client at <time>
		Then chat with client is open
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
	Scenario: Chat history is being saved
		Given chat feature is turned on in Settings
		And user is authorized as manager
		And page with clients available for chat is open
		When I click on client
		And I send message
		And I close chat
		And I click on client
		Then old messages are shown in chat
	
	@p2
	Scenario: Chat includes identifier that shows if the manager is offline
		Given chat feature is turned on in Settings
		And client is offline
		And user is authorized as manager
		And page with clients available for chat is open
		When I click on client
		Then chat with client is open
		And client's indicator is shown as offline
		And manager's indicator is shown as online