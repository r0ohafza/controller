// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import {IController} from "../core/IController.sol";

contract WETHController is IController {
    bytes4 constant DEPOSIT = 0xd0e30db0;
    bytes4 constant WITHDRAW = 0x2e1a7d4d;
    address constant WETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address[] weth = new address[](1);

    constructor() {
        // the outputs are already known and the sig only affects their
        // order so initialize the arrays beforehand and return as per sig
        weth[0] = WETH;
    }

    function canCall(
        address,
        bytes calldata data
    ) external view returns (bool, address[] memory, address[] memory)
    {
        bytes4 sig = bytes4(data);
        if(sig == DEPOSIT) return (true, weth, new address[](0));
        if(sig == WITHDRAW) return (true, new address[](0), weth);
        return (false, new address[](0), new address[](0));
    }
}