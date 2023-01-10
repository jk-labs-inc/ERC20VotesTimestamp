// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.5.0) (governance/extensions/GovernorVotesTimestamp.sol)

pragma solidity ^0.8.0;

import "../Governor.sol";
import "../utils/IVotesTimestamp.sol";

/**
 * @dev Extension of {Governor} for voting weight extraction from an {ERC20VotesTimestamp} token, or since v4.5 an {ERC721VotesTimestamp} token.
 *
 * _Available since v4.3._
 */
abstract contract GovernorVotes is Governor {
    IVotesTimestamp public immutable token;

    constructor(IVotesTimestamp tokenAddress) {
        token = tokenAddress;
    }

    /**
     * Read the voting weight from the token's built in snapshot mechanism (see {IGovernor-getVotes}).
     */
    function getVotes(address account, uint256 timestamp) public view virtual override returns (uint256) {
        return token.getPastVotes(account, timestamp);
    }
}