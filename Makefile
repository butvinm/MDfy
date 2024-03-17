DIST_DIR = dist

$(DIST_DIR):
	@mkdir -p $@

compile: $(DIST_DIR)
	elm make src/Main.elm --output=$(DIST_DIR)/main.js

package: compile $(DIST_DIR)
	cp src/index.html $(DIST_DIR)/index.html

dev:
	@make package
	elm-live src/Main.elm --dir=$(DIST_DIR) --open -- --output=$(DIST_DIR)/main.js
