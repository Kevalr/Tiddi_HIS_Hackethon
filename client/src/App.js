import { useState, useEffect } from "react";
import Learning from "./contracts/learning.json";
import Web3 from "web3";
import Home from "./pages/Home";

function App() {
  const [state, setState] = useState({
    web3: null,
    contract: null,
  });
  const [data, setData] = useState("nill");
  useEffect(() => {
    const provider = new Web3.providers.HttpProvider("HTTP://127.0.0.1:7545");

    async function template() {
      const web3 = new Web3(provider);
      const networkId = await web3.eth.net.getId();
      const deployedNetwork = Learning.networks[networkId];
      const contract = new web3.eth.Contract(
        Learning.abi,
        deployedNetwork.address
      );
      console.log(contract);
      setState({ web3: web3, contract: contract });
    }
    provider && template();
  }, []);


  useEffect(() => {
    debugger
    const { contract } = state;
    async function readData() {
      const data = await contract.methods.add().call();
      console.log('result :- ', data);
      setData(data);
    }
    contract && readData();
  }, [state]);

  useEffect(() => {
    console.log(data);
  },[data])
  // async function writeData() {
  //   const { contract } = state;
  //   const data = document.querySelector("#value").value;
  //   await contract.methods
  //     .setter(data)
  //     .send({ from: "0x1f4F90f9aA5779f2C1E190133C2c872944bDED1c" });
  //   window.location.reload();
  // }
  return (
    <div className="App">
      {/* <h1 className="text-3xl font-bold underline">Hello world!</h1> */}
      <Home />
    </div>
  );
}

export default App;
