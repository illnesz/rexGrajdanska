#!/bin/bash

echo
if [ $# -eq 0 ]; then
	echo "[ERROR] Въведете регистрационен или VIN номер на автомобил."
else
	if [ ${#1} -eq 17 ]; then
		curl -s -k 'https://www2.guaranteefund.org/bg/информационен-център-и-справки/услуги/проверка-за-вaлиднa-зaстрaховкa-го#validgo' --data-raw 'dkn=&rama='$1'&stiker=&seria=&date=&send=търси' | html-to-text --tables=.success-results-sm,.success-results --ignoreHref=true --wordwrap=200 | grep -A10 "КЪМ ДАТА" | sed "s/SUCCESS-RESULTS \[\/IMAGES\/CHECKMARK.PNG\] /[ACTIVE]/g"
	else
		curl -s -k 'https://www2.guaranteefund.org/bg/информационен-център-и-справки/услуги/проверка-за-вaлиднa-зaстрaховкa-го#validgo' --data-raw 'dkn='$1'&rama=&stiker=&seria=&date=&send=търси' | html-to-text --tables=.success-results-sm,.success-results --ignoreHref=true --wordwrap=200 | grep -A10 "КЪМ ДАТА" | sed "s/SUCCESS-RESULTS \[\/IMAGES\/CHECKMARK.PNG\] /[ACTIVE]/g"
	fi
fi
