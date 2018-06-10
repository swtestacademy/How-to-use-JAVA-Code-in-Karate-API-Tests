Feature: sample karate test script

  Scenario: Login to Loadium
    * def doStorage =
"""
function(args) {
  var DataStorage = Java.type('examples.DataStorage');
  var dS = new DataStorage();
  return dS.write(args);
}
"""
    Given url 'https://account.loadium.com/uaa/oauth/token?grant_type=password&password=YOUR-PASSWORD&username=YOUR-USER-NAME&scope=openid'
    And header Accept = 'application/json'
    And header Authorization = 'Basic dGVzdGluaXVtU3VpdGVUcnVzdGVkQ2xpZW50OnRlc3Rpbml1bVN1aXRlU2VjcmV0S2V5'
    And request {}
    Then method POST
    Then status 200
    * def token = $.access_token
    * def result = call doStorage {'key': #(token)}

