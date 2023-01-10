# ERC20VotesTimestamp

## What is it?

A more interoperable and easier to use token standard for denominating time for token voting.

The implementation is just [OpenZeppelin's v4.5 ERC20Votes](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/afb20119b33072da041c97ea717d3ce4417b5e01/contracts/token/ERC20/extensions/ERC20Votes.sol), but it uses `block.timestamp` as the time denomination instead of `block.number`!

## Why should my project use this?

 - Having users interact with UNIX timestamps provides a much better user experience than trying to guess/estimate for them or have them try to guess what block number will be at a given UNIX time in the future.
 - User experience is improved even more if you are a project that deploys across multiple EVM-compatible chains because not all chains produce blocks at the same rate and so `block.number` is not consistent across chains, whereas `block.timestamp` is.
 - Relying on block number can introduces non-deterministic behavior in code with regards to when it will be executed in UNIX time (introduced by the fact that the rate at which blockchains produce blocks is not constant) which can result in confusing and even possibly error-prone experiences if execution of code at or relative to a specific UNIX time is critical to its function.
