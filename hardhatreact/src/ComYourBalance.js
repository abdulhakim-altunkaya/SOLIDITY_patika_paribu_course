import React from 'react';
import { ethers } from "ethers";
import { useState } from 'react';
import { CONTRACT_ABI } from "./ContractABI.js";
import { CONTRACT_ADDRESS } from "./ContractAddress";

function ComYourBalance() {
  let[yourBalance, setYourBalance] = useState("");
  let contract;
  let signer;

  const getYourBalance = async () => {
    const provider = new ethers.providers.Web3Provider(window.ethereum);
    signer = provider.getSigner();
    contract = new ethers.Contract(CONTRACT_ADDRESS, CONTRACT_ABI, signer);
    const dataYourBalance = await contract.getBalance();
    //ALTERNATIVE: await contract.balanceOf(signer.getAddress())
    const dataYourBalance2 = dataYourBalance.toString();
    setYourBalance(dataYourBalance2);
  }


  return (
    <div>
        <button onClick={getYourBalance}>Get Your Balance</button>  <br /><br />
        <span>Your Balance: {yourBalance}</span>
    </div>
  )
}

export default ComYourBalance