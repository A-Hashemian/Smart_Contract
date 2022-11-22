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

   assembly {
            
            let x := sload(0)// Get _storage1 from the array (this will contain the length)
            
            let _ptr := 0x00 // Allocate some scratch memory we can use for a pointer
            mstore(_ptr, 0) // Store our pointer to the _storage1 address
            
            let k := keccak256(_ptr, 0x20) // Generate the key from the index for the first element
            x := sload(k) // Get the first element of _storage1
            
            k := add(keccak256(_ptr, 0x20),1) // Generate the key from the index for the second element
            x := sload(k) // Get the second element of _storage1
            
            sstore(k, 78) // Change the second element of _storage1 to 78
        }
}