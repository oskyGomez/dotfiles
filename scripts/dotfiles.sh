for source_path in $PWD/dotfiles/.*; do
  # Get the path and filename
  source_dir=$(dirname $source_path)
  source_filename=${source_path##*/}
  target_path="$HOME/${source_filename}"

  # Symlink!
  ln -s $source_path $target_path
done;
