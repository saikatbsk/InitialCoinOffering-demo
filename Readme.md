## Initial Coin Offering Contracts Using Truffle + OpenZeppelin

This is an example demonstrating how an application can be built using blockchain.
For this example we're building a ICO using Truffle and OpenZeppelin.

[Truffle](http://truffleframework.com/) is the most popular development framework for Ethereum.
And [OpenZeppelin](https://openzeppelin.org/) is an open framework of reusable and secure smart contracts in the Solidity language.

#### 1. Cloning the Repository and Installing Dependencies

```
git clone https://tools.publicis.sapient.com/bitbucket/scm/kep/initialcoinoffering-demo.git
npm install -g ethereumjs-testrpc
npm install -g truffle
cd InitialCoinOffering-demo
truffle init
npm install zeppelin-solidity
```

#### 2. Important Source Files

- `contracts/DopeCoin.sol`: Token contract defined here.
- `contracts/DopeCoinCrowdsale.sol`: Crowdsale contract.
- `migrations/2_deploy_contracts.js`: Deploy contract.
- `truffle.js`: Truffle configuration.

#### 3. Deploy the Contract

Open a terminal and run:
```
testrpc -u 0
```
It will run `testrpc` with the one unlocked account. We are using `testrpc` for our development needs.

Open another terminal and run the following inside `truffle console`:
```
truffle compile
truffle migrate
```

Now, if you look at the `testrpc` tab you will see that the contract was deployed successfully.

We may use `truffle console` to buy some Dope Coins.

#### 4. Truffle Console Example

Open `truffle console` by issuing the command:
```
truffle console
```

Set your account by issuing the following command:
```
account1 = web3.eth.accounts[1]
```

Get the address of the token instance that was created when the crowdsale contract was deployed:
```
DopeCoinCrowdsale.deployed().then(inst => { crowdsale = inst })
crowdsale.token().then(addr => { tokenAddress = addr } )
dopeCoinInstance = DopeCoin.at(tokenAddress)
```

Now check the number of tokens `account1` has:
```
dopeCoinInstance.balanceOf(account1).then(balance => balance.toString(10))
```

Buying tokens:
```
DopeCoinCrowdsale.deployed().then(inst => inst.sendTransaction({ from: account1, value: web3.toWei(5, "ether")}))
```

Check the amount of tokens for `account1` again:
```
dopeCoinInstance.balanceOf(account1).then(balance => account1DopTokenBalance = balance.toString(10))
```

When we created our token we made it with 18 decimals, which the same as what ether has.
Let's display without the decimals:
```
web3.fromWei(account1DopTokenBalance, "ether")
```

Exit `truffle console`:
```
.exit
```
