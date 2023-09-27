#!/usr/bin/env sh

sps_dir=$1

shell_list=$(awk '{print $1}' "${sps_dir}/output-checks.txt" | sort -u | tr '\n' ' ')

table_header=
table_header_line=
for shell_column in $shell_list; do
  table_header="${table_header}| $shell_column "
  table_header_line="${table_header_line}|:---:"
done
table_header="${table_header}|"
table_header_line="${table_header_line}|"

echo "## Compatibility"
echo "${table_header}"
echo "${table_header_line}"

for shell_row_index in $(seq 1 10); do
  table_row=""
  for shell_column in $shell_list; do
    table_cell="-"
    version_count=0
    while read check_entry; do
       shell_name=$(echo "${check_entry}" | cut -d ' ' -f1)
       shell_version=$(echo "${check_entry}" | cut -d ' ' -f2)
       shell_status=$(echo "${check_entry}" | cut -d ' ' -f3)
       shell_flag=$([ "$shell_status" = "ok" ] && echo "✅" || echo "❌")
       [ "${shell_column}" != "${shell_name}" ] && continue
       version_count=$((version_count + 1))
       [ "${version_count}" != "${shell_row_index}" ] && continue
       table_cell="${shell_version}<br>${shell_flag}"
    done < "${sps_dir}/output-checks.txt"
    table_row="${table_row}| $table_cell "
  done
  table_row="${table_row}|"
  echo "${table_row}"
done


