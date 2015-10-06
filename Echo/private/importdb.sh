#!/usr/bin/env bash
mongoimport -h localhost:3001 --db meteor --collection childcares --type csv --file "\Users\Toshiba PC\Desktop\Workspace\Echo\private\childcares.csv" --headerline