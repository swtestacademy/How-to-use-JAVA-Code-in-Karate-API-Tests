Feature: sample karate test script

  Scenario: Get All Tests
    * def doStorage =
"""
function(args) {
  var DataStorage = Java.type('examples.DataStorage');
  var dS = new DataStorage();
  return dS.read(args);
}"""
    Given url 'https://loadium.io/resource1/api/tests'
    And header Accept = 'application/json'
   # And header Authorization = 'Bearer ' + key.token
    * def result = call doStorage 'key'
    And header Authorization = 'Bearer ' + result
    Then method GET
    Then status 200
    * def testKey = $.testBasicDetailsDTOs[0].testKey
    * def schema = $.testBasicDetailsDTOs[0]
    Then print testKey
    And match schema ==
"""
{
   "testKey":"#string",
   "testName":"#string",
   "createdTime":#number,
   "favorite":#boolean,
   "testType":"#string",
   "owner":"#string",
   "dedicatedIPUsed":#boolean
}
"""
