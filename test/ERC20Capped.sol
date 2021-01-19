//SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.6.0 <0.8.0;

import "./ERC20.sol";

abstract contract ERC20Capped is ERC20 {
    using SafeMath for uint256;

    uint256 private _cap;

    constructor (uint256 cap_) internal {
        require(cap_ > 0, "ERC20Capped: cap is 0");
        _cap = cap_;
    }

    function cap() public view returns (uint256) {
        return _cap;
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual override {
        super._beforeTokenTransfer(from, to, amount);

        if (from == address(0)) { // When minting tokens
            require(totalSupply().add(amount) <= _cap, "ERC20Capped: cap exceeded");
        }
    }
}
