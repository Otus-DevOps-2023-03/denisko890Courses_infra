#!/bin/bash
systemctl daemon-reload
systemctl enable monolith_reddit.service
systemctl start monolith_reddit
