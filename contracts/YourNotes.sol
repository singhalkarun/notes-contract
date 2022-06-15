//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract YourNotes {
    struct Note {
        uint id;
        string note;
        bool isDeleted;
    }

    mapping(address => Note[]) private _userNotesDict;

    function addNote(string memory _note) public returns (bool) {
        uint currentCount = _userNotesDict[msg.sender].length;

        _userNotesDict[msg.sender].push(Note(currentCount + 1, _note, false));

        return true;
    }

    function deleteNote(uint _id) public returns (bool) {
        uint totalNotes = _userNotesDict[msg.sender].length;

        require(_id < totalNotes, "Invalid Id");

        _userNotesDict[msg.sender][_id].isDeleted = true;
        return true;
    }

    function getNotes() public view returns (Note[] memory) {
        return _userNotesDict[msg.sender];
    }
}