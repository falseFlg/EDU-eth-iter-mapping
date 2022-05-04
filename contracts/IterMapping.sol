// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract IterMapping {
    mapping(string => uint256) public ages;
    string[] public keys;
    mapping(string => bool) public isInserted;

    function set(string memory _name, uint256 _age) public {
        ages[_name] = _age;

        if (!isInserted[_name]) {
            isInserted[_name] = true;
            keys.push(_name);
        }
    }

    function length() public view returns (uint256) {
        return keys.length;
    }

    function get(uint256 _index) public view returns (uint256) {
        string memory key = keys[_index];
        return ages[key];
    }

    function values() public view returns (uint256[] memory) {
        uint256[] memory vals = new uint256[](keys.length);

        for (uint256 i = 0; i < keys.length; i++) {
            vals[i] = ages[keys[i]];
        }

        return vals;
    }
}
