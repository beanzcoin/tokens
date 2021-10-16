pragma solidity >=0.7.0 <0.9.0;

import "./interfaces/IBeanzFounder.sol";

contract BeanzFoundation is IBeanzFounder {
    struct Founder {
        bool member;
        address founder;
    }

    mapping(address => Founder) public founders;
    uint256 public memberCount;

    constructor() {
        memberCount = 0;
    }

    function subscribe() public {
        Founder storage founder = founders[msg.sender];
        require(!founder.member, "multiple subscriptions are not allowed.");
        founders[msg.sender] = Founder(true, msg.sender);
        memberCount++;
    }
}
