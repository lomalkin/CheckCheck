#!/bin/bash

DATA_DIR="db"
CACHE_DIR="cache"

cd "$(dirname "$0")"

rm "$CACHE_DIR"/*.txt

# Функция, обрабатывающая одну строку из конкретного чека
checkcheck () {
	while read data; do
		echo "# Src: $data"
		PARTS=$(echo "$data" | tr "&" "\n")
		#echo "$PARTS"
		PAR_T=$(echo "$PARTS" | grep "^t=" | awk -F'=' '{ print $2 }')
		PAR_S=$(echo "$PARTS" | grep "^s=" | awk -F'=' '{ print $2 }')
		#PAR_FN=$(echo "$PARTS" | grep "^fn=" | awk -F'=' '{ print $2 }')
		#PAR_FP=$(echo "$PARTS" | grep "^fp=" | awk -F'=' '{ print $2 }')
		#PAR_I=$(echo "$PARTS" | grep "^i=" | awk -F'=' '{ print $2 }')
		#PAR_N=$(echo "$PARTS" | grep "^n=" | awk -F'=' '{ print $2 }')
		
		#DATE=$(echo "$PAR_T" | awk -F"T" '{ print $1 }')
		YEARMON="${PAR_T:0:6}"
		echo $PAR_S >> "$CACHE_DIR"/"$YEARMON".txt
		echo -e "$PAR_T\t$PAR_S"
	done
}

# Берем сразу всю базу
# Исключаем ссылки, начинающиеся с http[s]
# Строка в чеке всегда содержит символы "&" или "="

time cat "$DATA_DIR/"* | grep "QR-Code" | awk -F':' '{ print $5 }' | grep -iv "^http." | grep "&" | sort | uniq | checkcheck

for FILE in `find "$CACHE_DIR" -type f -name *.txt`
do
    DATE=$(echo $FILE | awk -F'/' '{ print $2 }' | awk -F'.' '{ print $1 }')
    SUM=$(awk '{ sum += $1 } END { print sum }' "$FILE")
    echo -e "$DATE\t$SUM" >> "$CACHE_DIR"/"report.txt"
done
echo

COUNT=$(cat "$DATA_DIR/"* | wc -l)
echo -e "Processed scans:\t$COUNT"

echo
echo "Report:"
cat "$CACHE_DIR"/"report.txt" | sort
