// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ProductPricing {
    struct ParticipantData {
        string name;
        string email;
        bool gender;
    }
    address private owner;
    uint8 private index;
    uint8 private maxOfParticipant;

    mapping(address => uint8) public mapAddress;
    mapping(uint8 => ParticipantData) public mapPaticipant;

    constructor(uint8 _maxOfParticipant) {
        owner = msg.sender;
        index = 0;
        maxOfParticipant = _maxOfParticipant;
    }

    function getOwner() public view returns (address) {
        return owner;
    }

    function getParticipant(
        uint8 _index
    ) public view returns (string memory, string memory, bool) {
        require(_index > index, "User index doesn't exists!");
        ParticipantData memory _par = mapPaticipant[_index];

        return (_par.name, _par.email, _par.gender);
    }

    function getParticipants() public view returns (ParticipantData[] memory) {
        ParticipantData[] memory _lst = new ParticipantData[](index);

        for (uint8 i = 1; i <= index; i++) {
            _lst[i-1] = mapPaticipant[i];
        }

        return _lst;
    }

    function addParticipant(
        string memory _name,
        string memory _email,
        bool _gender
    ) public notOwner checkLimitUserRegister checkDuplicateAccount{
        index++;
        mapAddress[msg.sender] = index;
        mapPaticipant[index] = ParticipantData(_name, _email, _gender);
    }

    modifier notOwner {
        require(msg.sender != owner, "This function not allow owner.");
        _;
    }

    modifier checkLimitUserRegister {
        require(index >= maxOfParticipant, "Can't register more account.");
        _;
    }

    modifier checkDuplicateAccount {
        require(mapAddress[msg.sender] == 0, "This account has registered.");
        _;
    }
}
