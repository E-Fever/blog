all: buildjs deploy

clean:
	rm -rf build

buildjs:
	node build.js

deploy: buildjs 
	@if [ ! -d ./github_build ]; then \
		git clone https://github.com/e-fever/e-fever.github.io github_build;  \
	else \
		cd github_build && git pull --rebase && cd .. ; \
	fi
	cp -rf build/* github_build
	cd github_build ; git add -A ; git commit -a ; git push


.PHONY: deploy
