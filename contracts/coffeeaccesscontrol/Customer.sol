pragma solidity ^0.4.24;

// Import the library 'Roles'
import "./Roles.sol";

// Define a contract 'CustomerWorkerRole' to manage this role - add, remove, check
contract CustomerWorkerRole {
  using Roles for Roles.Role;

  // Define 2 events, one for Adding, and other for Removing
  event CustomerWorkerAdded(address indexed account);
  event CustomerWorkerRemoved(address indexed account);

  // Define a struct 'farmers' by inheriting from 'Roles' library, struct Role
  Roles.Role private customerworkers;

  // In the constructor make the address that deploys this contract the 1st farmer
  constructor() public {
    _addCustomerWorker(msg.sender);
  }

  // Define a modifier that checks to see if msg.sender has the appropriate role
  modifier onlyCustomerWorker() {
    require(isCustomerWorker(msg.sender));
    _;
  }

  // Define a function 'isFarmer' to check this role
  function isCustomerWorker(address account) public view returns (bool) {
    return customerworkers.has(account);
  }

  // Define a function 'addFarmer' that adds this role
  function addCustomerWorker(address account) public onlyCustomerWorker {
    _addCustomerWorker(account);
  }

  // Define a function 'renounceFarmer' to renounce this role
  function renounceCustomerWorker() public {
    _removeCustomerWorker(msg.sender);
  }

  // Define an internal function '_addFarmer' to add this role, called by 'addFarmer'
  function _addCustomerWorker(address account) internal {
    customerworkers.add(account);
    emit CustomerWorkerAdded(account);
  }

  // Define an internal function '_removeFarmer' to remove this role, called by 'removeFarmer'
  function _removeCustomerWorker(address account) internal {
    customerworkers.remove(account);
    emit CustomerWorkerRemoved(account);
  }
}