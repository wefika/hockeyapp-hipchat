#!/usr/bin/env bash

curl -i -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -X POST \
  -d '{"public_identifier":"test","type":"ping","ping":{"hello":"world"},"sent_at":"2013-10-22T20:35:18+00:00","title":"Ping for Fika","url":"https://rink.hockeyapp.net/manage/apps/43785"}' \
  http://localhost:9292/webhook


