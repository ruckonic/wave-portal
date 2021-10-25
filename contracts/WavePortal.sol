// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import 'hardhat/console.sol';

struct Wave {
    address waver;
    string message;
    uint256 timestamp;
}

contract WavePortal {
    uint256 totalWaves;
    event NewWave(address indexed from, uint256 timestamp, string message);

    Wave[] waves;

    uint256 private seed;

    mapping(address => uint256) private _lastWavedAt;

    constructor() payable {
        console.log('Geat!! is a smart contract');
    }

    function wave(string memory _message) public {
        require(
            _lastWavedAt[msg.sender] + 15 minutes < block.timestamp,
            'Wait 15m'
        );

        totalWaves++;
        waves.push(Wave(msg.sender, _message, block.timestamp));
        console.log('%s Waved', msg.sender);

        uint256 randomNumber = (block.difficulty + block.timestamp + seed) %
            100;
        console.log('Random # generated: %s', randomNumber);
        seed = randomNumber;

        if (randomNumber < 50) {
            console.log('%s won!', msg.sender);

            uint256 prizeAmount = 0.0001 ether;

            require(
                prizeAmount <= address(this).balance,
                'Trying to withdraw more money than the contract has.'
            );
            (bool success, ) = (msg.sender).call{value: prizeAmount}('');
            require(success, 'Failed to withdraw money from contract.');
        }

        emit NewWave(msg.sender, block.timestamp, _message);
    }

    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }

    function getTotalWaves() public view returns (uint256) {
        console.log('account: %s has %d waves', msg.sender, totalWaves);
        return totalWaves;
    }
}
