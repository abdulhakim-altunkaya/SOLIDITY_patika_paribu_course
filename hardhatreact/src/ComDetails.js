import React from 'react';
import { ethers } from "ethers";
import { useState } from 'react';
import { CONTRACT_ABI } from "./ContractABI.js";
import { CONTRACT_ADDRESS } from "./ContractAddress";

function ComDetails() {
  let[contractOwner, setContractOwner] = useState("");
  let[mintedTokens, setMintedTokens] = useState("");

  let contract;
  let signer;

  const getDetails = async () => {
    const provider = new ethers.providers.Web3Provider(window.ethereum);
    signer = provider.getSigner();
    contract = new ethers.Contract(CONTRACT_ADDRESS, CONTRACT_ABI, signer);
    const dataOwner = await contract.owner();
    const dataMintedTokens = await contract.totalSupply();
    const dataMintedTokens2 = dataMintedTokens.toString();
    setContractOwner(dataOwner);
    setMintedTokens(dataMintedTokens2);
  }

  return (
    <div className='detailsArea'>
      <button onClick={getDetails}>Get Details</button>
      <span>Contract Owner: {contractOwner} </span>
      <span>Token Name: Dev Coin - DEVCON </span>
      <span>Total Minted Tokens: {mintedTokens}</span>
    </div>
  ) 
}

export default ComDetails;
