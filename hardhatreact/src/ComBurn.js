import React from 'react';
import { ethers } from "ethers";
import { useState } from 'react';
import { CONTRACT_ABI } from "./ContractABI.js";
import { CONTRACT_ADDRESS } from "./ContractAddress";

function ComBurn() {
  let[amount, setAmount] = useState();
  let[text, setText] = useState();

  let contract;
  let signer;
  const connectContract = async () => {
    const provider = new ethers.providers.Web3Provider(window.ethereum);
    signer = provider.getSigner();
    contract = new ethers.Contract(CONTRACT_ADDRESS, CONTRACT_ABI, signer);
  }

  const burnTokens = async () => {
    await connectContract();
    const txResponse = await contract.burnToken(amount)
    await txResponse.wait();
    setAmount("");
    setText(`Your request is successful. Please wait for around 10 seconds then click Get Your Balance button below`)
  }

  return (
    <div>
        <input type="number" name='burnInput' value={amount} onChange={(e)=>setAmount(e.target.value)} /> &nbsp;&nbsp;&nbsp;
        <button onClick={burnTokens}>Burn Tokens</button>
        <p>{text}</p>
    </div>
  )
}

export default ComBurn