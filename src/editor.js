import { CodeJar } from "./codejar.js";


function highlight(editor) {
    editor.textContent = editor.textContent;
    hljs.highlightElement(editor);
};

customElements.define(
    "mdfy-editor",
    class extends HTMLElement {
        constructor() {
            super();
            CodeJar(this, highlight);
        }
    }
);
