build: bundler
	bundle exec jekyll build

start: bundler
	bundle exec jekyll serve --incremental --host 127.1 --port 4004

new: bundler
	read -p "Article title: " title && rake post["$$title"]

bundler: /usr/local/bin/bundle
/usr/local/bin/bundle:
	gem install bundler
	bundle install

edit:
	bundle open minima
