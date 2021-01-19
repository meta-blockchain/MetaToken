//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.10;

import "./IERC20.sol";
import "./ERC20Capped.sol";

contract MTCT is ERC20("Meta crypto-token", "MTCT"), ERC20Capped(10000000e8) {
    function namex() public view returns (string memory) {
        return " ";
    }
    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual override {
        super._beforeTokenTransfer(from, to, amount);
    }
}
