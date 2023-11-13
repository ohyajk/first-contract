// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


contract EvenCounter {


    address owner;


    struct Counter {
        uint number;
        string description;
    }


    Counter counter;


    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can increment or decrement the counter");
        _;
    }


    constructor(uint initial_value, string memory description) {
        owner = msg.sender;
        counter = Counter(initial_value, description);
    }


    function increment() external onlyOwner {
        counter.number += 2;
    }


    function decrement() external onlyOwner {
        counter.number -= 2;
    }


    function value() external view returns(uint) {
        return counter.number;
    }

 

}