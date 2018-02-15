// This file defines the token contract.

pragma solidity ^0.4.13;

// OpenZeppelin smart contract templates does all the heavy duty.
// The idea is to have a token where the supply is controlled by
// an owner who can emit tokens and assign them.
import 'zeppelin-solidity/contracts/token/MintableToken.sol';

contract DopeCoin is MintableToken {
  string public name     = "DOPE COIN";
  string public symbol   = "DOP";
  uint8  public decimals = 18;
}
