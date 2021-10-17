const hre = require('hardhat')

async function main() {
  const [owner] = await hre.ethers.getSigners()
  const ownerBalance = await owner.getBalance()

  console.log('Deployed with account: ', owner.address)
  console.log('Owner balance: ', ownerBalance.toString())

  const Contract = await hre.ethers.getContractFactory('WavePortal')
  const portal = await Contract.deploy()
  await portal.deployed()

  console.log('WavePortal address: ', portal.address)
}

main()
  .then(() => process.exit(0))
  .catch((err) => {
    console.error(err)
    process.exit(1)
  })
