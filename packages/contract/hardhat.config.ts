import "@nomicfoundation/hardhat-toolbox";
import * as dotenv from "dotenv";

require("@nomiclabs/hardhat-ethers");
require("@nomiclabs/hardhat-etherscan");

dotenv.config();

module.exports = {
  defaultNetwork: "matic",
  networks: {
    hardhat: {},
    polygon_mumbai: {
      url: "https://rpc-mainnet.maticvigil.com",
      accounts: [process.env.PRIVATE_KEY],
    },
  },
  etherscan: {
    apiKey: process.env.POLYGONSCAN_API_KEY,
  },
  solidity: {
    version: "0.8.9",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
    },
  },
};
