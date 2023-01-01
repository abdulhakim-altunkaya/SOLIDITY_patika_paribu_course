//SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/a4596cab053d46e0bf2957e2ed490cb3921539ee/contracts/token/ERC20/IERC20.sol";

contract CrowdFund {
    event Launch(
        uint id,
        address indexed creator, //aynı yaratıcaya ait kampanyaları bulmak için indexed kullandık
        uint goal,
        uint32 startAt,
        uint32 endAt
    );
    event Pledge(uint indexed id, address indexed pledger, uint amount);
    event Unpledged(uint indexed id, address indexed unpledger, uint amount);
    event Claim(uint id);
    event Cancel(uint id);
    event Refund(uint indexed id, address indexed pledger, uint amount);
    struct Campaign {
        address creator;//kampanyayı başlatan
        uint goal;
        uint pledged;
        uint32 startAt;//kampanya başlangıç
        uint32 endAt;//kampanya bitiş
        bool claimed;
    }

    IERC20 public immutable token;

    mapping(uint => Campaign) public campaigns;
    mapping(uint => mapping(address => uint)) public pledgedAmount;

    //Kampanya para birimini seçiyoruz, IERC20 uyumlu
    constructor(address _token) {
        token = IERC20(_token);
    }


    uint public count;//her kampanya için bir numara

    function launch(uint _goal, uint32 _startAt, uint32 _endAt) external {
        require(_startAt >= block.timestamp, "start at < now");
        require(_endAt >= _startAt, "end time must be bigger");
        require(_endAt <= block.timestamp + 90 days, "campaign finished");
        count++;
        Campaigns[count] = Campaign({
            creator: msg.sender,
            goal: _goal,
            pledged: 0,
            startAt: _startAt,
            endAt:_endAt,
            claimed: false
        });
        emit Launch(count, msg.sender, _goal, _startAt, _endAt);
    } 
    //kazara durumda kampanyayı iptal etmek için
    function cancel(uint _id) external {
        Campaign memory campaign = campaigns[_id];
        require(msg.sender == campaign.creator, "not creator");
        require(block.timestamp < campaign.startAt, "already started");
        delete campaigns[_id];
        emit Cancel(_id);
    }
    //Kampanyaya para yatırma fonksiyonu
    function pledge(uint _id, uint _amount) external {
        Campaign storage campaign = campaigns[_id];
        require(block.timestamp >= campaign.startAt, "not started");
        require(block.timestamp <= campaign.endAt, "campaign ended");
        campaign.pledged += _amount;
        pledgedAmount[_id][msg.sender] += _amount; //adding to campaign balance
        token.transferFrom(msg.sender, address(this), _amount);
        emit Pledge(_id, msg.sender, _amount);
    }
    //kampanya başarısız olursa, geri çekmelere imkan tanımak gerekir:
    function unpledge(uint _id, uint _amount) external {
        Campaign storage campaign = campaigns[_id];
        require(block.timestamp <= campaign.endAt, "cam. ended");
        campaign.pledged -= _amount; //decreasing from campaign balance
        pledgedAmount[_id][msg.sender] -= _amount;
        token.transfer(msg.sender, _amount);
        emit Unpledged(_id, msg.sender, _amount);
    }
    //Eğer kampanya parası hedeften çok olursa
    function claim(uint _id) external {
        Campaign storage campaign = campaigns[_id];
        require(msg.sender == campaign.creator, "not creator");
        require(block.timestamp > campaign.endAt, "not ended");
        require(campaign.pledged >= campaign.goal, "pledge < goal");
        require(!campaign.claimed, "claimed");
        campaign.claimed = true;
        token.transfer(msg.sender, campaign.pledged);
        emit Claim(_id);
    }

    //Kampanya başarısız olursa, parayı yatıranlar geri çekebilecek
    function refund(uint _id) external {
        Campaign storage campaign = campaigns[_id];
        require(block.timestamp > campaign.endAt, "not ended");
        require(campaign.pledged < campaign.goal, "pledge < goal");
        
        uint bal = pledgedAmount[_id][msg.sender];
        pledgedAmount[_id][msg.sender] = 0;
        token.transfer(msg.sender, bal);
        emit Refund(_id, msg.sender, bal);
    }
}