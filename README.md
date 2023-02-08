# defund-node
docker build . -t defund
cd /mnt/blockstore/defund/config
wget -O genesis.json https://raw.githubusercontent.com/defund-labs/testnet/main/defund-private-4/genesis.json
update confit.toml
  seeds="9f92e47ea6861f75bf8a450a681218baae396f01@94.130.219.37:26656,f03f3a18bae28f2099648b1c8b1eadf3323cf741@162.55.211.136:26656,f8fa20444c3c56a2d3b4fdc57b3fd059f7ae3127@148.251.43.226:56656,70a1f41dea262730e7ab027bcf8bd2616160a9a9@142.132.202.86:17000,e47e5e7ae537147a23995117ea8b2d4c2a408dcb@172.104.159.69:45656,74e6425e7ec76e6eaef92643b6181c42d5b8a3b8@defund-testnet-seed.itrocket.net:443"
peers="d9184a3a61c56b803c7b317cd595e83bbae3925e@194.163.174.231:26677,5e7853ec4f74dba1d3ae721ff9f50926107efc38@65.108.6.45:60556,f114c02efc5aa7ee3ee6733d806a1fae2fbfb66b@65.108.46.123:56656,aa2c9df37e372c7928435075497fb0fb7ff9427e@38.129.16.18:26656,f2985029a48319330b99767d676412383e7061bf@194.163.155.84:36656,daff7b8cbcae4902c3c4542113ba521f968cc3f8@213.239.217.52:29656"

sed -i.default "s/^seeds *=.*/seeds = \"$seeds\"/;" $HOME/.defund/config/config.toml

docker run -it -v /mnt/blockstore/defund/:/root/.defund tendermint unsafe-reset-all
docker run -it -d -v /mnt/blockstore/defund/:/root/.defund -p 26656:26656 -p 26657:26657 --name defund defund --home /root/.defund 

https://nodes.guru/defund/setup-guide/en
