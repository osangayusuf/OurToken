// SPDX-License-Identifier: MIT

pragma solidity ^0.8.28;

import {DeployOurToken} from "../script/DeployOurToken.s.sol";
import {OurToken} from "../src/OurToken.sol";
import {Test, console} from "forge-std/Test.sol";
import {StdCheats} from "forge-std/StdCheats.sol";

interface MintableToken {
    function mint(address, uint256) external;
}

contract OurTokenTest is StdCheats, Test {
    OurToken public ourToken;
    DeployOurToken public deployer;
    uint256 public constant STARTING_BALANCE = 150 ether;
    address public bob;
    address public alice;

    function setUp() public {
        deployer = new DeployOurToken();
        ourToken = deployer.run();

        bob = makeAddr("bob");
        alice = makeAddr("alice");
        
        vm.prank(msg.sender);
        ourToken.transfer(bob, STARTING_BALANCE);
    }

    function testInitialSupply() public view {
        assertEq(ourToken.totalSupply(), deployer.INITIAL_SUPPLY());
    }

    function testUsersCantMint() public {
        vm.expectRevert();
        MintableToken(address(ourToken)).mint(address(this), 1);
    }

    function testAllowance() public {
        uint256 amount = 100 ether;
        ourToken.approve(bob, amount);
        assertEq(ourToken.allowance(address(this), bob), amount);
    }

    function testTransfer() public {
        uint256 amount = 100 ether;
        vm.prank(bob);
        ourToken.transfer(alice, amount);
        assertEq(ourToken.balanceOf(alice), amount);
    }

    function testTransferFrom() public {
        uint256 amount = 100 ether;

        vm.prank(bob);
        ourToken.approve(alice, amount);
        
        vm.prank(alice);
        ourToken.transferFrom(bob, alice, amount);
        assertEq(ourToken.balanceOf(alice), amount);
    }

    function testTransferExceedsBalance() public {
        uint256 amount = ourToken.balanceOf(address(this)) + 1;
        vm.expectRevert();
        ourToken.transfer(bob, amount);
    }

    function testTransferFromExceedsAllowance() public {
        uint256 amount = 100 ether;
        ourToken.approve(bob, amount - 1);
        vm.prank(bob);
        vm.expectRevert();
        ourToken.transferFrom(address(this), alice, amount);
    }
}
