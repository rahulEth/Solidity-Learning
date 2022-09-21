require("@nomicfoundation/hardhat-toolbox");
require('dotenv').config()

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: { 
    compilers: [
      {
        version: "0.8.13",
      },
      {
        version: "0.6.7",
        settings: {},
      },
    ],
  },
  networks: { 
    rinkeby: {
      url: `https://rinkeby.infura.io/v3/${process.env.INFURA_API_KEY}`,
      accounts: [process.env.METAMASK_PRIVATE_KEY]
    }
  },
  etherscan: {
    apiKey: `${process.env.APIKEY}`,
  }

};
