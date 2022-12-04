// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {

    mapping(address => bool) whitelists;

    uint256 public autoMintAmount = 10 * (10 ** uint256(decimals())) ;
    uint256 public initMintTime = 0;

    constructor () ERC20("TinTinTestToken", "TTT") {
        // 合约部署后，将管理员自己添加到白名单
        whitelists[msg.sender] = true;

        _mint(msg.sender, 1000000 * (10 ** uint256(decimals())));
    }



    // 判断 user 是否在白名单里，仅管理员有权限
    function isUserInWhitelist(address user) public onlyOwner view returns (bool) {
        return whitelists[user];
    }

    // 判断自己是否在白名单里
    // 前端在调用合约的时候，用来判断自己是不是在白名单里，从而可以控制是否显示 mint 按钮
    function amIInWhitelist() public view returns (bool) {
        return isUserInWhitelist(msg.sender);
    }

    // 添加 user 到白名单里，仅管理员有权限
    function addToWhitelist(address user) public onlyOwner {
        whitelists[user] = true;
    }

    // 从白名单里移除 user，仅管理员有权限
    function removeFromWhitelist(address user) public onlyOwner {
        whitelists[user] = false;
    }

    // 要求当前用户是否在白名单内
    modifier inWhitelist() {
        require(whitelists[msg.sender], "user not in whitelist");
        _;
    }

    function autoMint() public onlyOwner {
        require(block.timestamp > initMintTime + 60,"only when time allowed");
        _mint(msg.sender, autoMintAmount);
        initMintTime = block.timestamp;
    }

    function changeAmount(uint256 amount) public inWhitelist {
        autoMintAmount = amount;
    }

}