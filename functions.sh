#!/usr/bin/env bash

# Turn chacon device on/off
#
# $1 (string): action [on|off]
# $2 (string): device name (name of the device to activate/deactivate)
# $3 (bool, optional): Silent ("True" for no Jarvis response, "False" or no value for Jarvis response)
#
# return (int): 0 if success, else > 0
pg_chacon_turn () {
  local -r order="$(jv_sanitize "$2")"
  while read device; do
    local sdevice="$(jv_sanitize "$device" ".*")"
    if [[ "$order" =~ .*$sdevice.* ]]; then
      local address="$(echo $pg_chacon_config | jq -r ".devices[] | select(.name==\"$device\") | .address")"
      local dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
      if [[ ! $3 =~ "True" ]]; then
        say "$(pg_chacon_lg "switching_$1" "$2")"
      fi
      local cmd="sudo $dir/chacon_send $pg_chacon_gpio_pin $pg_chacon_num $address $1"
      eval $cmd | while read line; do jv_debug "$line"; done
      if [[ ! $3 =~ "True" ]]; then
        say "$(pg_chacon_lg "switching_$1_done" "$2")"
      fi
      return $?
    fi
  done <<< "$(echo $pg_chacon_config | jq -r '.devices[].name')"
  say "$(pg_chacon_lg no_device_matching "$2")"
  return 1
}
