// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.8.0;
import "remix_tests.sol"; // this import is automatically injected by Remix.

contract VaccinePass {
   
    struct Person {
        string name;
        string birthdate;
        uint numberOfVaccines;
    }
   
    struct Vaccine{
        string doctor;
        string date; 
        string location;
        string description; 
        string expiringDate;    
    }
    
    
    //mappings to track the data
    mapping (string => Person) persons;
    mapping (string => mapping (uint => Vaccine)) allVaccines;
    
    
    //Save the Json information about a person in the smartcontract
    //returns true if person was created and false if person already existed
    function createPerson(string calldata personID, string calldata _name, string calldata _birthdate) public returns(bool) {
       
        if (!personExists(personID)){
            Person memory newPerson = persons[personID]; 
            newPerson.birthdate = _birthdate;
            newPerson.name = _name;
            persons[personID] = newPerson;
            return true;
        }
        
        return false;
    } 
    
    //Adds Vaccine to the specified person.
    function addVaccineTo(string calldata personID, string memory _doctor, string memory _date, string memory _location, string memory _description, string memory _expiringDate) public returns (bool){
        
        // if person doesn't exist return false
        if (!personExists(personID)){
            return false;
        }
        
        //update Number of vaccines in person
        Person storage person = persons[personID];
        uint _nbVaccines = person.numberOfVaccines;
        person.numberOfVaccines += 1;
        
        //Add vaccine to storage
        Vaccine storage vaccine = allVaccines[personID][_nbVaccines];
        vaccine.doctor = _doctor;
        vaccine.date = _date;
        vaccine.location = _location;
        vaccine.description = _description;
        vaccine.expiringDate = _expiringDate;
        
        return true;
    } 
    
    //Check if a person exists in the 
    function personExists(string calldata personID) public view returns (bool) {
        
        //check if person already exists. person.birthdate String will be 0 bytes if non existing
        Person memory person = persons[personID]; 
        bytes memory tempEmptyStringTest = bytes(person.birthdate); // Uses memory
        if (tempEmptyStringTest.length == 0) {
            return false;
        }
        
        return true; 
    } 
    
    //Return all the fields of the saved Json from a person
    function getPerson(string calldata personID) public view returns (string memory, string memory, uint){
        Person memory person = persons[personID];
        return(person.name, person.birthdate, person.numberOfVaccines);
    }
    
    //Return the fields of the vaccine by index
    function getVaccineByIndex(string calldata personID, uint number) public view returns(string memory, string memory, string memory, string memory, string memory) {
        Vaccine memory vaccine = allVaccines[personID][number];
        return (vaccine.doctor, vaccine.date, vaccine.location, vaccine.description, vaccine.expiringDate);
    } 
    
    //Return the total number of vaccines of a person
    function getNbOfVaccinesPerson(string calldata personID) public view returns(uint){
        return persons[personID].numberOfVaccines;
    }

}
