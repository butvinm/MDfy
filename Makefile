DIST_DIR = dist

$(DIST_DIR):
	@mkdir -p $@

compile: $(DIST_DIR)
	elm make src/Main.elm --output=$(DIST_DIR)/main.js

package: compile $(DIST_DIR)
	cp src/*.html $(DIST_DIR)
	cp src/*.js $(DIST_DIR)
	cp lib/* $(DIST_DIR)/

dev:
	@make package
	elm-live src/Main.elm --dir=$(DIST_DIR) --open -- --output=$(DIST_DIR)/main.js
