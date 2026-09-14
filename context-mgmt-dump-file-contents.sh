#!/bin/bash

output_file="files_output.txt"

echo "=================================="
echo "FILE DUMPER SCRIPT"
echo "=================================="
echo "Current directory: $(pwd)"
echo ""

# Step 1: Choose directory
read -p "Run from current directory? (y/n): " use_current
if [[ $use_current =~ ^[Nn]$ ]]; then
    read -p "Enter directory path: " target_dir
    if [[ ! -d "$target_dir" ]]; then
        echo "Error: Directory '$target_dir' does not exist"
        exit 1
    fi
else
    target_dir="."
fi

# Get absolute path
target_dir_abs=$(cd "$target_dir" && pwd)
echo "Target directory: $target_dir_abs"
echo ""

# Step 2: Hidden files option
read -p "Include hidden files? (y/n): " include_hidden

# Step 3: If hidden files, show exclusion options
exclude_patterns=()
if [[ $include_hidden =~ ^[Yy]$ ]]; then
    echo ""
    echo "Directory structure:"
    tree -a "$target_dir"
    echo ""
    
    # Build list of all directories and files
    declare -a items
    counter=1
    
    echo "Available items to exclude:"
    while IFS= read -r item; do
        # Get relative path by removing target directory prefix
        rel_path="${item#$target_dir_abs/}"
        if [[ "$item" == "$target_dir_abs" ]]; then
            rel_path="."
        fi
        
        items[$counter]="$item"
        if [[ -d "$item" ]]; then
            echo "[$counter] DIR:  $rel_path/"
        else
            echo "[$counter] FILE: $rel_path"
        fi
        ((counter++))
    done < <(find "$target_dir" -print | sort)
    
    echo ""
    read -p "Enter numbers to exclude (space separated, or press enter for none): " exclusions
    
    if [[ -n "$exclusions" ]]; then
        for num in $exclusions; do
            if [[ -n "${items[$num]}" ]]; then
                excluded_item="${items[$num]}"
                exclude_patterns+=("-not" "-path" "$excluded_item")
                # If it's a directory, also exclude everything inside it
                if [[ -d "$excluded_item" ]]; then
                    exclude_patterns+=("-not" "-path" "$excluded_item/*")
                fi
            fi
        done
    fi
fi

echo ""
echo "Processing files..."

# Clear output file
> "$output_file"

# Build and execute find command
if [[ $include_hidden =~ ^[Yy]$ ]]; then
    find "$target_dir" -type f -not -name "$output_file" "${exclude_patterns[@]}" | while read -r file; do
        echo "=================================================================================" >> "$output_file"
        echo "File: $file" >> "$output_file"
        echo "=================================================================================" >> "$output_file"
        cat "$file" >> "$output_file"
        echo "" >> "$output_file"
        echo "" >> "$output_file"
    done
else
    find "$target_dir" -type f -not -name ".*" -not -path "*/.*" -not -name "$output_file" | while read -r file; do
        echo "=================================================================================" >> "$output_file"
        echo "File: $file" >> "$output_file"
        echo "=================================================================================" >> "$output_file"
        cat "$file" >> "$output_file"
        echo "" >> "$output_file"
        echo "" >> "$output_file"
    done
fi

echo "Done. Output written to $output_file"
