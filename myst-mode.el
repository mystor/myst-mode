(defvar myst-keywords
  '("let"
    "if"
    "then"
    "else"))

(defvar myst-font-lock-defaults
  `((
     ("'\\([^']\\)*'" . font-lock-string-face)
     ("\"\\([^\"]\\)*\"" . font-lock-string-face)
     ; ("'\\([^']\\)*'" . font-lock-keyword-face)
     (,(regexp-opt myst-keywords 'words) . font-lock-builtin-face)
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
