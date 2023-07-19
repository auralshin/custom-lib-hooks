// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title IHook interface
 * @dev This interface defines the methods that a Hook contract should implement.
 * These methods will be called before and after certain actions are executed.
 */
interface IHook {
    /**
     * @notice Called before executing the specified action
     * @param action The identifier of the action to be executed
     * @dev Implementers of this interface should include the logic to be executed before the action.
     * This could include checks, state modifications, event logging etc.
     */
    function beforeAction(bytes32 action) external;

    /**
     * @notice Called after executing the specified action
     * @param action The identifier of the action that was executed
     * @dev Implementers of this interface should include the logic to be executed after the action.
     * This could include checks, state modifications, event logging etc.
     */
    function afterAction(bytes32 action) external;
}
