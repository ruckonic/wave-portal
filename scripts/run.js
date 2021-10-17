const hre = require('hardhat')

async function main() {
  const [owner, randomPerson] = await hre.ethers.getSigners()
  const waveContractFactory = await hre.ethers.getContractFactory('WavePortal')
  const waveContract = await waveContractFactory.deploy()

  await waveContract.deployed()

  console.log('Contract deployed to:', waveContract.address)
  console.log('Contract deployed by:', owner.address)

  let waveCount = await waveContract.getTotalWaves()

  let waveTxt = await waveContract.wave()
  await waveTxt.wait()

  waveCount = await waveContract.getTotalWaves()

  const waveTxt2 = await waveContract.connect(randomPerson).wave()
  const waveTxt3 = await waveContract.connect(randomPerson).wave()

  await waveTxt2.wait()
  await waveTxt3.wait()

  waveCount = await waveContract.connect(randomPerson).getTotalWaves()
}

main()
  .then(() => process.exit(0))
  .catch((err) => {
    console.error(err)
    process.exit(1)
  })
