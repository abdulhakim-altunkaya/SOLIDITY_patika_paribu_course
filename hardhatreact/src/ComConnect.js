import React from 'react';
import { ethers } from "ethers";
import { useState } from 'react';
import { CONTRACT_ABI } from "./ContractABI.js";
import { CONTRACT_ADDRESS } from "./ContractAddress";

function ComConnect() {
  let[contractAddress, setContractAddress] = useState("");

  let contract;
  let signer;

  const connectContract = async () => {
    const provider = new ethers.providers.Web3Provider(window.ethereum);
    signer = provider.getSigner();
    contract = new ethers.Contract(CONTRACT_ADDRESS, CONTRACT_ABI, signer);
    setContractAddress(contract.address);
  }

  return (
    <div className='detailsArea'>
      <button onClick={connectContract}>Connect to Contract</button>
      <span>Contract Address: {contractAddress} </span>
    </div>
  )
}

export default ComConnect;
