all: buildjs deploy

cleanAll:
	rm -rf build
	rm -rf github_build

buildjs:
	node build.js

deploy: buildjs 
	git commit -a; git push
	@if [ ! -d ./github_build ]; then \
		git clone https://github.com/e-fever/e-fever.github.io github_build;  \
	else \
		cd github_build && git pull --rebase && cd .. ; \
	fi
	cp -rf build/* github_build
	cd github_build ; git add -A ; git commit -a --allow-empty-message -m '' ; git push


.PHONY: deploy
