SERVER_IP=127.1
SERVER_PORT=4005

build: bundler
	bundle exec jekyll build

start: bundler
	bundle exec jekyll serve --host $(SERVER_IP) --port $(SERVER_PORT)

new: bundler
	read -p "Article title: " title && rake post["$$title"]

bundler: /usr/local/bin/bundle
/usr/local/bin/bundle:
	gem install bundler
	bundle install

edit:
	bundle open minima

open:
	open http://$(SERVER_IP):$(SERVER_PORT)

version_file="_data/version.yml"
current_revision=$(shell git rev-parse --short HEAD)
version:
	echo "hash: $(current_revision)" > $(version_file)
	git commit $(version_file) -m "bump version"
