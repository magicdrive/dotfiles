fvim() {
  files=$(git ls-files) &&
  selected_files=$(echo "$files" | fzf -m --preview 'bat --color=always --style=header,grid --line-range :100 {}') &&
  vim $selected_files
}


