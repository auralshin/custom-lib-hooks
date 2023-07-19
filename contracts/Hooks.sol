// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {IHook} from '../interfaces/IHooks.sol';

/**
 * @title Hooks library
 * @dev This library manages hook contracts for different actions.
 * Hooks can be added, removed, and fetched for each action.
 */
library Hooks {

    /**
     * @dev Defines a Hooks struct that maps action identifiers to hook contracts.
     */
    struct Hooks {
        mapping(bytes32 => IHook) hooks;
    }

    /**
     * @notice Adds a hook contract for a specific action.
     * @param self The Hooks struct to operate on.
     * @param action The identifier of the action.
     * @param hook The address of the hook contract.
     * @dev This method adds a hook contract to the Hooks struct for a given action.
     * If the hook is already set for the action, it reverts the transaction.
     */
    function addHook(Hooks storage self, bytes32 action, IHook hook) internal {
        require(self.hooks[action] != hook, "Hook already set for this action");
        self.hooks[action] = hook;
    }

    /**
     * @notice Removes the hook contract for a specific action.
     * @param self The Hooks struct to operate on.
     * @param action The identifier of the action.
     * @dev This method removes the hook contract from the Hooks struct for a given action.
     * If there is no hook set for the action, it reverts the transaction.
     */
    function removeHook(Hooks storage self, bytes32 action) internal {
        require(self.hooks[action] != IHook(address(0)), "No hook set for this action");
        delete self.hooks[action];
    }

    /**
     * @notice Returns the hook contract for a specific action.
     * @param self The Hooks struct to operate on.
     * @param action The identifier of the action.
     * @return The address of the hook contract for the action.
     * @dev This method retrieves the hook contract from the Hooks struct for a given action.
     * If there is no hook set for the action, it reverts the transaction.
     */
    function getHook(Hooks storage self, bytes32 action) internal view returns (IHook) {
        require(self.hooks[action] != IHook(address(0)), "No hook set for this action");
        return self.hooks[action];
    }
}

