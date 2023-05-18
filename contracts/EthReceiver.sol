// SPDX-License-Identifier: MIT

pragma solidity ^0.18.0;

abstract contract EthReceiver {
    error EthDepositRejected();

    receive() external payable {
        _receive();
    }

    function _receive() internal virtual {
        // solhint-disable-next-line avoid-tx-origin
        if (msg.sender == tx.origin) revert EthDepositRejected();
    }
}
