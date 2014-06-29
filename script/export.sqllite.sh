#!/bin/bash
/usr/bin/sqlite3 ./db/development.sqlite3 <<!
.headers on
.mode csv
.output out.csv
select * from houses;
!
