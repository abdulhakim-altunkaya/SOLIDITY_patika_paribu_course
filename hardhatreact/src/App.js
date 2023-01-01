import ComBurn from "./ComBurn";
import ComConnect from "./ComConnect";
import ComMint from "./ComMint";
import ComYourBalance from "./ComYourBalance";
import { useState } from "react";
import ComDetails from "./ComDetails";

function App() {
  const {ethereum} = window;
  let [account, setAccount] = useState("");
  const connectMetamask = async () => {
    if(window.ethereum !== "undefined") {
      let accounts = await ethereum.request({ method: "eth_requestAccounts"});
      setAccount(accounts[0]);
    }
  }
  return (
    <div className="App">
      <button onClick={connectMetamask}>Connect Metamask</button> <br />
      <span>Your Address: {account}</span> 
      <ComConnect />
      <ComDetails />
      <ComMint />
      <ComBurn />
      <ComYourBalance />
    </div>
  );
}

export default App;
