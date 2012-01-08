;;; markup-preview.el

;; Copyright (C) 2012 mori_dev

;; Author: mori_dev <mori.dev.asdf@gmail.com>
;; Keywords: utility
;; Prefix: anything-howm-

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Setting Sample

;; (require 'markup-preview)
;; 


(defvar preferred-format nil)

(setq extension-markup-alist
      '(("md" . "Markdown")
        ("mkd" . "Markdown")
        ("mkdn" . "Markdown")
        ("mdown" . "Markdown")
        ("markdown" . "Markdown")
        ("rst" . "rest")
        ("rest" . "rest")
        ("org" . "Org")
        ("textile" . "Textile")
        ("pod" . "Pod")
        ("creole" . "creole")
        ("rdoc" . "rdoc")
        ("mediawiki" . "MediaWiki")))

(defun get-markup (extension)
  (if preferred-format
      preferred-format
    (cdr (assoc extension extension-markup-alist))))

(defun markup-preview ()
  (interactive)
  (let ((str (get-target-string))
        (temp-file (make-temp-file "markup-preview-region-"))
        (markup (get-markup (file-name-extension (buffer-file-name)))))
    (unless temp-file (error "fail to get temp-file"))
    (unless markup (error "fail to get markup"))
    (with-temp-file temp-file (insert str))
    (call-markup-preview-command temp-file markup)))

(defun get-target-string ()
  (if (region-active-p)
      (buffer-substring-no-properties (region-beginning) (region-end))
    (buffer-substring-no-properties (point-min) (point-max))))

(defun call-markup-preview-command (temp-file markup)
  (call-process-shell-command
     (concat "markup-preview " "--filepath " temp-file " --markup " markup " -d"))
  (delete-file temp-file))
;; (call-process-shell-command "gnome-open /tmp/markup-preview-region-2273Qtu")
  ;; (unless (executable-find "markup-preview")
  ;;   (error "markup-preview not found"))
  ;; (call-process-shell-command
  ;;    (concat "markup-preview " "--filepath " temp-file " -m")))

(provide 'markup-preview)