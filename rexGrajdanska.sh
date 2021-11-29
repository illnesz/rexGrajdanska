#!/bin/bash

echo
if [ $# -eq 0 ]; then
	echo "[ERROR] Въведете регистрационен номер на автомобил."
else
	curl -s -k 'https://www2.guaranteefund.org/bg/%D0%B8%D0%BD%D1%84%D0%BE%D1%80%D0%BC%D0%B0%D1%86%D0%B8%D0%BE%D0%BD%D0%B5%D0%BD-%D1%86%D0%B5%D0%BD%D1%82%D1%8A%D1%80-%D0%B8-%D1%81%D0%BF%D1%80%D0%B0%D0%B2%D0%BA%D0%B8/%D1%83%D1%81%D0%BB%D1%83%D0%B3%D0%B8/%D0%BF%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D0%BA%D0%B0-%D0%B7%D0%B0-%D0%B2a%D0%BB%D0%B8%D0%B4%D0%BDa-%D0%B7a%D1%81%D1%82%D1%80a%D1%85%D0%BE%D0%B2%D0%BAa-%D0%B3%D0%BE#validgo' --data-raw 'dkn='$1'&rama=&stiker=&seria=&date=&send=%D1%82%D1%8A%D1%80%D1%81%D0%B8' | html-to-text --tables=.success-results-sm,.success-results --ignoreHref=true --wordwrap=200 | grep -A10 "КЪМ ДАТА" | sed "s/SUCCESS-RESULTS \[\/IMAGES\/CHECKMARK.PNG\] /[ACTIVE]/g"
fi
