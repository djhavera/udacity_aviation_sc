pragma solidity ^0.4.24;

// Import the library 'Roles'
import "./Roles.sol";

// Define a contract 'FactoryWorkerRole' to manage this role - add, remove, check
contract FactoryWorkerRole {
  using Roles for Roles.Role;

  // Define 2 events, one for Adding, and other for Removing
  event FactoryWorkerAdded(address indexed account);
  event FactoryWorkerRemoved(address indexed account);

  // Define a struct 'farmers' by inheriting from 'Roles' library, struct Role
  Roles.Role private factoryworkers;

  // In the constructor make the address that deploys this contract the 1st farmer
  constructor() public {
    _addFactoryWorker(msg.sender);
  }

  // Define a modifier that checks to see if msg.sender has the appropriate role
  modifier onlyFactoryWorker() {
    require(isFactoryWorker(msg.sender));
    _;
  }

  // Define a function 'isFarmer' to check this role
  function isFactoryWorker(address account) public view returns (bool) {
    return factoryworkers.has(account);
  }

  // Define a function 'addFarmer' that adds this role
  function addFactoryWorker(address account) public onlyFactoryWorker {
    _addFactoryWorker(account);
  }

  // Define a function 'renounceFarmer' to renounce this role
  function renounceFactoryWorker() public {
    _removeFactoryWorker(msg.sender);
  }

  // Define an internal function '_addFarmer' to add this role, called by 'addFarmer'
  function _addFactoryWorker(address account) internal {
    factoryworkers.add(account);
    emit FactoryWorkerAdded(account);
  }

  // Define an internal function '_removeFarmer' to remove this role, called by 'removeFarmer'
  function _removeFactoryWorker(address account) internal {
    factoryworkers.remove(account);
    emit FactoryWorkerRemoved(account);
  }
}