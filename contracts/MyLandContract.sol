pragma solidity ^0.5.11;
contract MyLandContract
{
    struct Land
    {
        address ownerAddress;
        string location;
        uint cost;
        uint landID;
        uint wantSell;
    }
    uint public totalLandsCounter; //total no of lands via this contract at any time 
    constructor () public
    {
        totalLandsCounter = 0;

    }
    //land addition event
    event Add(address _owner, uint _landID);

    //one account can hold many lands (many landTokens, each token one land)
    mapping (address => Land[]) public _ownedLands;

    function addLand(address propertyOwner, string memory _location, uint _cost) public returns (unit)
    {
        totalLandsCounter = totalLandsCounter + 1;

        Land memory myLand = Land(
            {
                ownerAddress: propertyOwner,
                location: _location,
                cost: _cost,
                landID: totalLandsCounter,
                wantSell: 1
            });
        _ownedLands[propertyOwner].push(myLand);
        emit Add(propertyOwner, totalLandsCounter);
        return totalLandsCounter;
    }
}