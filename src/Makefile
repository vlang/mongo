version = 1.24.4

.DEFAULT_GOAL := install
build:
	apt install -y cmake libssl-dev libsasl2-dev
	wget -O mongo-c-driver.tar.gz https://github.com/mongodb/mongo-c-driver/releases/download/$(version)/mongo-c-driver-$(version).tar.gz # Check for the latest version
	tar xzf mongo-c-driver.tar.gz
	mkdir -p mongo-c-driver-$(version)/cmake-build
	cd mongo-c-driver-$(version)/cmake-build  && \
	cmake -DENABLE_AUTOMATIC_INIT_AND_CLEANUP=OFF .. && \
	make && \
	make install
install:
	apt install -y libbson-1.0-0 libmongoc-1.0-0
