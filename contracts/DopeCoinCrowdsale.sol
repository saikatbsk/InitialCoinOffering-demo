// This file defines the crowdsale contract.

pragma solidity ^0.4.13;

import './DopeCoin.sol';
import 'zeppelin-solidity/contracts/crowdsale/Crowdsale.sol';

contract DopeCoinCrowdsale is Crowdsale {
    function DopeCoinCrowdsale(uint256 _startTime, uint256 _endTime, uint256 _rate, address _wallet)
        Crowdsale(_startTime, _endTime, _rate, _wallet) {
    }

    // Creates the token to be sold.
    // Override this method to have crowdsale of a specific MintableToken token.
    function createTokenContract() internal returns (MintableToken) {
        return new DopeCoin();
    }
}
