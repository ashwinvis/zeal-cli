.PHONY: build linux-install

build:
	poetry run python ./build_system/update_version.py
	poetry run pyinstaller --onefile ./src/zeal_cli/__init__.py --name zeal-cli

.PHONY: clean
clean:
	rm -f ./src/zeal_cli/version.py
	rm -rf ./dist
	rm -rf ./zeal-cli.spec
	rm -rf ./build

.PHONY: linux-install
linux-install:
	poetry install
	rm ~/.local/bin/zeal-cli
	make build
	chmod +x ./dist/zeal-cli
	cp ./dist/zeal-cli ~/.local/bin/zeal-cli
