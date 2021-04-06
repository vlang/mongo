build:
	apt install cmake libssl-dev libsasl2-dev
	wget -O mongo-c-driver.tar.gz https://github.com/mongodb/mongo-c-driver/releases/download/1.16.2/mongo-c-driver-1.16.2.tar.gz # Check for the latest version
	tar xzf mongo-c-driver.tar.gz
	mkdir -p mongo-c-driver-1.16.2/cmake-build
	cd mongo-c-driver-1.16.2/cmake-build  && \
	cmake -DENABLE_AUTOMATIC_INIT_AND_CLEANUP=OFF .. && \
	make && \
	make install
install:
	apt install libbson-1.0-0 libmongoc-1.0-0
