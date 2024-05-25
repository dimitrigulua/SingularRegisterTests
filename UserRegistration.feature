Feature: User registration

    Test cases for /register endpoint
    
    You can use these valid credentials in following tests:
        username: test
        password: test123456

    User that already exists in the system:
        username: testuser1
   
    Scenario: Successful User Registration
        Given an API that allows user registration
        And valid username and password
        When I send a POST request to "/register" with username, password and confirm_password
        Then the response status code should be 10

    Scenario: Username Length Violation (Too Short)
        Given an API that allows user registration
        When I Send a POST request to "/register" with username of 3 characters, password and confirm_password
        Then the response status code should be 99

    Scenario: Username Lenght Violation (Too Long)
        Given an API that allows user registration
        When I Send a POST request to "/register" with username of 31 characters, password and confirm_password
        Then the response status code should be 99

    Scenario: Password Lenght Violation
        Given an API that allows user registration
        When I Send a POST request to "/register" with username, password and confirm_password of 4 characters
        Then the response status code should be 129

    Scenario: Missing Required Parameters
        Given an API that allows user registration
        When I Send a POST request to "/register" only without any parameter
        Then the response status code should be 112

    Scenario: Password And Username Shouldn't be equal
        Given an API that allows user registration
        When I Send a POST request to "/register" with username, password and confirm_password equal to username
        Then the response status code should be 129

    Scenario: Password and Password Confirmation Mismatch
        Given an API that allows user registration
        When I Send a POST request to "/register" with username, password, confirm password different from initial password
        Then the response status code should be 129

    Scenario: Password Contains Whitespaces
        Given an API that allows user registration
        When I Send a POST request to "/register" with valid username, password and confirm_password that contains whitespaces ("test pass") 
        Then the response status code should be 129

    Scenario: Username Already Exists
        Given an API that allows user registration
        When I Send a POST request to "/register" with username "testuser1" and a valid password, confirm_password
        Then the response status code should be 113

    