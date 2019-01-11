pragma solidity ^0.5.0;

contract Election {
    // Model a Candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }
    // store accounts that have voted
    mapping(address => bool) public voters;
    //store and Fetch the Candidates
    mapping(uint => Candidate) public candidates;
     
    // store Candidates Count
    uint public candidatesCount;

    constructor() public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

      
    function addCandidate (string memory _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote (uint _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender], "Already Voted :)");

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Not a valid candidate");

        voters[msg.sender] = true;
        // update voteCount
        
        candidates[_candidateId].voteCount++;
    }

}
 

