#!/usr/bin/env bash


function CheckBb() {

    if [ ${PLATTFORM} == "ESPO" ]; then
		MYSQL_CHECKDATA=$(mysql -h database_server -u root -p${MYSQL_ROOT_PASSWORD} ${MYSQL_DATABASE} --skip-column-names -e "SHOW TABLES FROM ${MYSQL_DATABASE} LIKE '%account_portal_user';")
	fi

	if [ ${PLATTFORM} == "TREOPIM" ] || [ ${PLATTFORM} == "TREOCORE" ] || [ ${PLATTFORM} == "TREODAM" ]; then
		MYSQL_CHECKDATA=$(mysql -h database_server -u root -p${MYSQL_ROOT_PASSWORD} ${MYSQL_DATABASE} --skip-column-names -e "SHOW TABLES FROM ${MYSQL_DATABASE} LIKE '%entity_team';")
	fi

	if [[ -z $MYSQL_CHECKDATA ]]; then
		true
	else
		false
	fi

}

function DbReachable() {

	ping -c1 database_server > /dev/null
	if [ $? -eq 0 ]; then
		true
	else
		false
	fi
}

function SetPhphVersion() {

    if [[ -z "$PHP_VER" ]]; then
        export PHP_VER=7.3
    fi

}
