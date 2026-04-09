#!/bin/bash
  echo "Available project configurations:"
  projects=$(awk 'BEGIN { RS="},{"; FS=":"; inarray=0 }
    /^[[:space:]]*"[^"]+":/ {
      gsub(/["{]/, "", $1)
      gsub(/^[[:space:]]+|[[:space:]]+$/, "", $1)
      if ($1 != "default") print $1
    }' ./config/projects.json)

  echo -e "\033[33mFound configurations:\033[0m"
  echo "$projects"
  echo "default"

  # Get user selection
  read -p "Select a configuration: " selected_config

  # Extract and display selected configuration
  echo -e "\033[33mConfiguration for $selected_config:\033[0m"
  awk -v config="$selected_config" '
    BEGIN { RS="}"; FS=":"; inconfig=0 }
    $0 ~ "\"" config "\"" {
      split($0, lines, "\n")
      for (i in lines) {
        if (lines[i] ~ /"[^"]+":/) {
          split(lines[i], parts, ":")
          key = parts[1]
          value = parts[2]
          gsub(/^[[:space:]]*"|"[[:space:]]*$/, "", key)
          gsub(/^[[:space:]]*"|"[[:space:]]*$|,/, "", value)
          if (key != config) {
            printf "\033[33m%s: %s\033[0m\n", key, value
    }
        }
      }
    }
  ' ./config/projects.json