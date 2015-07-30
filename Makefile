build:
	node build.js

deploy: build
	@if [ ! -d ./github_build ]; then \
		git clone https://github.com/e-fever/e-fever.github.io github_build;  \
	else \
		cd github_build && git pull --rebase && cd .. ; \
	fi
	cp -rf build/* github_build;
	cd github_build;
	git add -A && git commit --allow-empty-message && git push;
	cd .. ;


.PHONY: deploy
