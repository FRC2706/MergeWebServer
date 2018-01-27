#!/bin/bash
sudo apt install rails mysql-server ruby-all-dev ruby-mysql2 libmysqlclient-dev
bundle install
rake db:setup
