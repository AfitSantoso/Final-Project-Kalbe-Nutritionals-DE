path="/hdfs/data/data1"
name_of_directory="data1"
filename_excel="daily_market_price.xlsx"
source_dir="/local/data/market"
target_dir="$path/$name_of_directory"
log_file="$target_dir/move_file.log"

if [ -d "$target_dir" ]; then
  echo "There is $name_of_directory Directory Exists!"

  if [ -f "$source_dir/$filename_excel" ]; then
    cp "$source_dir/$filename_excel" "$target_dir/"
    echo "File $filename_excel moved successfully." >> "$log_file"
  else
    echo "File $filename_excel does not exist in the source directory."
  fi
else
  echo "$name_of_directory Directory Not Exists!"
  mkdir -p "$target_dir"
  echo "Directory $name_of_directory created." >> "$log_file"

  if [ -f "$source_dir/$filename_excel" ]; then
    cp "$source_dir/$filename_excel" "$target_dir/"
    echo "File $filename_excel moved successfully." >> "$log_file"
  else
    echo "File $filename_excel does not exist in the source directory."
  fi
fi
