# defund-node
docker build . -t defund

docker run -it -d -v /mnt/blockstore/defund/:/root/.defund -p 26656:26656 -p 26657:26657 --name defund defund --home /root/.defund 

https://nodes.guru/defund/setup-guide/en
