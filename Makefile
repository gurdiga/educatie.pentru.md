SERVER_IP=127.1
SERVER_PORT=4005

build: bundler
	bundle exec jekyll build

start: bundler
	bundle exec jekyll serve --host $(SERVER_IP) --port $(SERVER_PORT)

post: bundler
	read -p "Article title: " title && bundle exec jekyll post "$$title"

page:
	read -p "Page title: " title && bundle exec jekyll page "$$title"

# More jekyll-compose goodness, with `bundle exec`:
# jekyll page "My New Page"
# jekyll post "My New Post"
# jekyll draft "My new draft"
# jekyll publish _drafts/my-new-draft.md
# jekyll unpublish _posts/2014-01-24-my-new-draft.md

bundler: /usr/local/bin/bundle
/usr/local/bin/bundle:
	gem install bundler
	bundle install

edit:
	bundle open minima

open:
	open http://$(SERVER_IP):$(SERVER_PORT)
