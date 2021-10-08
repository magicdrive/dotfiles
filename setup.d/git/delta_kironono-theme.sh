#! /bin/bash


git config --global delta.features kironono-theme
git config --global delta.kironono-theme.file-decoration-style  'none'
git config --global delta.kironono-theme.file-style  'omit'
git config --global delta.kironono-theme.hunk-header-decoration-style  'blue ul'
git config --global delta.kironono-theme.hunk-header-file-style  '"#858dff" bold'
git config --global delta.kironono-theme.hunk-header-line-number-style  '"#7536ff" bold'
git config --global delta.kironono-theme.hunk-header-style  'file line-number syntax'
git config --global delta.kironono-theme.keep-plus-minus-markers  'true'
git config --global delta.kironono-theme.line-numbers  'true'
git config --global delta.kironono-theme.line-numbers-left-format  '"{nm:>4} "'
git config --global delta.kironono-theme.line-numbers-right-format  '"{np:>4}│"'
git config --global delta.kironono-theme.line-numbers-minus-style  '"#833d3d" bold'
git config --global delta.kironono-theme.line-numbers-plus-style  '"#345d3c" bold'
git config --global delta.kironono-theme.line-numbers-left-style  'blue'
git config --global delta.kironono-theme.line-numbers-right-style 'blue'
git config --global delta.kironono-theme.minus-style  syntax '"#412e32"'
git config --global delta.kironono-theme.minus-emph-style  'syntax "#833d3d"'
git config --global delta.kironono-theme.plus-style  syntax '"#293732"'
git config --global delta.kironono-theme.plus-emph-style  syntax '"#345d3c"'
git config --global delta.kironono-theme.syntax-theme  'Github'

exit 0
