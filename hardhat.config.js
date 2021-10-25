require('@nomiclabs/hardhat-waffle')

const { alchemy, rinkeby } = require('./config')

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: '0.8.4',
  networks: {
    rinkeby: {
      url: alchemy.url,
      accounts: [rinkeby.accountKey],
    },

    localhost: {
      chainId: 1337,
      accounts: [rinkeby.accountKey],
    },
  },
}
