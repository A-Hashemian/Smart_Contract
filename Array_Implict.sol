// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;



contract StorageMechanism {

    uint[] _storage1;
    uint[] _storage2;
    uint[] _storage3;
    
    function store() public {
        // Populate the arrays
        _storage1.push(1);
        _storage2.push(2);
        _storage3.push(3);
        _storage2.push(4);
        _storage1.push(2);
        _storage1.push(3);
        _storage1.push(4);
        
      
}