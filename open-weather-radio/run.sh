#!/usr/bin/with-contenv bashio

export freq=$(bashio::config 'freq')
export ppm=$(bashio::config 'ppm')
export gain=$(bashio::config 'gain')
export same=$(bashio::config 'same')
export dsamelog=$(bashio::config 'dsamelog')
export mqttsvr=$(bashio::config 'mqttsvr')
export mqttport=$(bashio::config 'mqttport')
export mqttusr=$(bashio::config 'mqttusr')
export mqttpwd=$(bashio::config 'mqttpwd')
export log_level=$(bashio::config 'log_level')
export test=$(bashio::config 'test')

exec ./init.sh