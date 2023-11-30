cp Dockerfile default-bpp-client.yml default-bpp-network.yml ~/protocol-server
cd ~/protocol-server

docker build -t bpp-client --build-arg default_yml=default-bpp-client.yml --build-arg port=BPP_CLIENT_PORT .
docker build -t bpp-network --build-arg default_yml=default-bpp-network.yml --build-arg port=BPP_NETWORK_PORT .

docker stop bpp-network bpp-client
docker rm bpp-network bpp-client
docker run --name bpp-client -it -d --network host bpp-client:latest
docker run --name bpp-network -it -d --network host bpp-network:latest