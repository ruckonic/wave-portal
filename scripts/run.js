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

  // let waveCount = await portal.getTotalWaves()
  // console.log('Wave count: ', waveCount.toNumber())

  // let waveTXT = await portal.wave('Your welcome')
  // await waveTXT.wait()

  // let allWaves = await portal.getAllWaves()
  // console.log({ allWaves })

  // const [_, randomPerson] = await hre.ethers.getSigners()
  // waveTXT = await portal.connect(randomPerson).wave('Another message!')
  // await waveTXT.wait()

  // allWaves = await portal.getAllWaves()
  // console.log({ allWaves })
}

main()
  .then(() => process.exit(0))
  .catch((err) => {
    console.error(err)
    process.exit(1)
  })
