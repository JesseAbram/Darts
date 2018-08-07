pragma solidity ^0.4.24;

contract darts{
    
    struct game{
        
        address player;
        uint amount; 
        uint won;
    }
    
    mapping (address => game) names;
    
    address [] public status; 
    
    
    address private owner;
   
    
    modifier isOwner {
        require(msg.sender == owner);
        _;
    }
  
    constructor () public {
        msg.sender == owner;
    }
  
    function fallback() payable public {
        
    }
    
    
    function setGame(address _player, uint _amount) public {
    
        var games = names[_player];
        games.player = _player;
        games.amount = _amount;
        
        
        status.push(_player) -1;
    }
   
    function giveRightToVote(address game) {
        if (msg.sender != owner) return;
        names[game].won = 1;
    }

   
    function getGame(address _address) view public returns (uint, uint){
        return (names[_address].amount, names[_address].won);   
    }
     
 
    function withdraw(address _address) public {
        if (names[_address].won != 0)
        msg.sender.transfer(address(this).balance);
        else revert();
    }

}
