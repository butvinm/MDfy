DIST_DIR = dist

$(DIST_DIR):
	@mkdir -p $@

compile: $(DIST_DIR)
	elm make src/Main.elm --output=dist/main.js

package: compile $(DIST_DIR)
	cp src/index.html dist/index.html

open:
	@echo "Go to http://localhost:8000/dist/index.html"
	@elm reactor > /dev/null
