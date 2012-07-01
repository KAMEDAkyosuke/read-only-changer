read-only-changer
=================

HOW TO USE
----------

    (add-to-list 'load-path "/path/to/your/saved/directory")
    (require 'read-only-changer)
    (setq read-only-changer-writeable-file-list
          '("^/path/to/your/writable/directory/or/file"))
    (add-hook 'find-file-hooks 'read-only-changer)
