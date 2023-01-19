require("@nomicfoundation/hardhat-toolbox");
const fs = require("fs")
const privateKey = fs.readFileSync(".secret").toString();
const projectId = "f08HYdlSsPgRvqX7rta_ffOsBPWNdGYK";

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  networks: {
    hardhat: {
      chainId: 31337
    }
    
    mumbai: {
      url: `https://polygon-mumbai.g.alchemy.com/v2/f08HYdlSsPgRvqX7rta_ffOsBPWNdGYK`,
      accounts:[privateKey ]
    },
    mainnet: {
      url: `https://polygon-mainnet.g.alchemy.com/v2/-P8a2g-NHtkukild6N9NCymuZrYm9MfM`,
      accounts:[privateKey ]
    },
  },
  solidity: "0.8.17",
};
