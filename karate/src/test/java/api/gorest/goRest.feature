Feature: Testando API Go REST

Background: Executa antes de cada teste
        * def url_base = "https://gorest.co.in"
        * def token = '2f165e328a70facef20ef81b3d7eaee5c465a533b33f2e7d6d437d2928ff2856'

        * def randomString = 
        """
            function random_string(s) {
                var text = "";
                var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
                for(var i = 0; i < s; i++) {
                    text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
                }
                return text
            }
        """

Scenario: Testando método get users
        Given url url_base
        And header Authorization = 'Bearer ' + token
        And path "/public/v2/users"
        When method get
        Then status 200

Scenario: Testando método get user com id inválido
        Given url url_base
        And header Authorization = 'Bearer ' + token
        And path "/public/v2/posts/nan"
        When method get
        Then status 404
        And match response.message == "Resource not found"

Scenario: Testando método post user
        * def random_string = randomString(10)
        * def payload =
        """
                {
                        "name": "Super awesome guy",
                        "gender": "male",
                        "status": "active"
                }
        """
        * payload.email = random_string + "@awesome.com"
        Given url url_base
        And header Authorization = 'Bearer ' + token
        And path "/public/v2/users"
        And request payload
        When method post
        Then status 201
        And match response.id == '#present'
        And match response.name == payload.name
        And match response.email == payload.email
        And match response.gender == payload.gender
        And match response.status == payload.status

Scenario: Testando método get user com id
        * def random_string = randomString(10)
        * def payload =
        """
                {
                        "name": "Super awesome guy",
                        "gender": "male",
                        "status": "active"
                }
        """
        * payload.email = random_string + "@awesome.com"
        Given url url_base
        And header Authorization = 'Bearer ' + token
        And path "/public/v2/users"
        And request payload
        When method post
        Then status 201
        And def id = response.id
        And header Authorization = 'Bearer ' + token
        And path "/public/v2/users/" + id
        When method get
        Then status 200
        And match response.id == id
        And match response.name == payload.name
        And match response.email == payload.email
        And match response.gender == payload.gender
        And match response.status == payload.status


Scenario: Testando método delete user
        * def random_string = randomString(10)
        * def payload =
        """
                {
                        "name": "Super awesome guy",
                        "gender": "male",
                        "status": "active"
                }
        """
        * payload.email = random_string + "@awesome.com"
        Given url url_base
        And header Authorization = 'Bearer ' + token
        And path "/public/v2/users"
        And request payload
        When method post
        Then status 201
        And def id = response.id
        And header Authorization = 'Bearer ' + token
        And path "/public/v2/users/" + id
        When method delete
        Then status 204
