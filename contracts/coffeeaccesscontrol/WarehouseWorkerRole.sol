pragma solidity ^0.4.24;

// Import the library 'Roles'
import "./Roles.sol";

// Define a contract 'WarehouseWorkerRole' to manage this role - add, remove, check
contract WarehouseWorkerRole {
  using Roles for Roles.Role;

  // Define 2 events, one for Adding, and other for Removing
  event WarehouseWorkerAdded(address indexed account);
  event WarehouseWorkerRemoved(address indexed account);

  // Define a struct 'farmers' by inheriting from 'Roles' library, struct Role
  Roles.Role private warehouseworkers;

  // In the constructor make the address that deploys this contract the 1st farmer
  constructor() public {
    _addWarehouseWorker(msg.sender);
  }

  // Define a modifier that checks to see if msg.sender has the appropriate role
  modifier onlyWarehouseWorker() {
    require(isWarehouseWorker(msg.sender));
    _;
  }

  // Define a function 'isFarmer' to check this role
  function isWarehouseWorker(address account) public view returns (bool) {
    return warehouseworkers.has(account);
  }

  // Define a function 'addFarmer' that adds this role
  function addWarehouseWorker(address account) public onlyWarehouseWorker {
    _addWarehouseWorker(account);
  }

  // Define a function 'renounceFarmer' to renounce this role
  function renounceWarehouseWorker() public {
    _removeWarehouseWorker(msg.sender);
  }

  // Define an internal function '_addFarmer' to add this role, called by 'addFarmer'
  function _addWarehouseWorker(address account) internal {
    warehouseworkers.add(account);
    emit WarehouseWorkerAdded(account);
  }

  // Define an internal function '_removeFarmer' to remove this role, called by 'removeFarmer'
  function _removeWarehouseWorker(address account) internal {
    warehouseworkers.remove(account);
    emit WarehouseWorkerRemoved(account);
  }
}