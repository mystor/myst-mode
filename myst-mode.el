(defvar myst-keywords
  '("import"
    "from"
    "as"
    "if"
    "then"
    "else"
    "fn"
    "do")
  "Keywords in the Myst programming language")

(defvar myst-builtins
  '("true"
    "false")
  "Literals in the Myst programming language")

(defvar myst-braces
  '("["
    "]"
    "{"
    "}"
    "("
    ")"))

(defvar myst-font-lock-defaults
  `((
     ; Strings
     ("'\\([^']\\)*'" . font-lock-string-face)
     ("\"\\([^\"]\\)*\"" . font-lock-string-face)

     ; Braces
     (,(regexp-opt myst-braces t) . font-lock-constant-face)

     ; Keywords
     (,(regexp-opt myst-keywords 'words) . font-lock-keyword-face)

     ; Builtins
     (,(regexp-opt myst-builtins 'words) . font-lock-builtin-face)
     ("\\([0-9]+\\(\\.[0-9]+\\)?\\)" . font-lock-builtin-face)

     ; Properties
     ("\\([a-zA-Z0-9_]+\\):"
      (1 font-lock-variable-name-face))

     ; Let statements
     ("\\(let\\) \\([a-zA-Z0-9_]+\\)"
      (1 font-lock-keyword-face)
      (2 font-lock-variable-name-face))
     ))
  "Default font-lock syntax values")

(defvar myst-syntax-table
  (let ((st (make-syntax-table)))
    (modify-syntax-entry ?- ". 12b" st)
    (modify-syntax-entry ?\n "> b" st)

    st)
  "Syntax table for myst-mode")

(define-derived-mode myst-mode fundamental-mode "Myst code"
  "Myst mode is a major mode for editing .myst files"
  :syntax-table myst-syntax-table

  (setq font-lock-defaults myst-font-lock-defaults)
  (setq comment-start "--")
  (setq comment-end ""))

(provide 'myst-mode)
