// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OwnerOnly {
    uint public a;
    uint public b;
    uint public c;
    uint public d;
    address public master;

    constructor() {
        master = msg.sender;
    }

    modifier masterOnly() {
        require(master == msg.sender, "Invalid Access");
        _;
    }

    function set(uint _a, uint _b, uint _c, uint _d) public masterOnly {
        a = _a;
        b = _b;
        c = _c;
        d = _d;
    }

    function operations() public view masterOnly returns (uint) {
        if ((a + b) > 10) {
            return a;
        } else if ((c + d) > 10) {
            return b;
        } else {
            return (c + b);
        }
    }
}

