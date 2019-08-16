NAME=tun2socks
BUILD_DIR=$(shell pwd)/build
CMD_DIR=$(shell pwd)/cmd
VERSION=$(shell git describe --tags --long || echo "unknown version")
BUILD_TIME=$(shell date -u)
BUILD_TAGS='fakedns session'
GOBUILD=go build -ldflags '-s -w -X "github.com/xjasonlyu/tun2socks/constant.Version=$(VERSION)"'

all: build

build:
	cd $(CMD_DIR) && $(GOBUILD) -v -tags $(BUILD_TAGS) -o $(BUILD_DIR)/$(NAME)

debug:
	cd $(CMD_DIR) && $(GOBUILD) -v -tags $(BUILD_TAGS) -race -o $(BUILD_DIR)/$(NAME)

clean:
	rm -rf $(BUILD_DIR)