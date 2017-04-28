#!/usr/bin/env bash

# Turn chacon device on/off
#
# $1: action [on|off]
# $2: device name (name of the device to activate/deactivate)
#
# return: 0 if success, else > 0
pg_chacon_turn () {
  local -r order="$(jv_sanitize "$2")"
  while read device; do
    local sdevice="$(jv_sanitize "$device" ".*")"
    if [[ "$order" =~ .*$sdevice.* ]]; then
      local address="$(echo $pg_chacon_config | jq -r ".devices[] | select(.name==\"$device\") | .address")"
      say "$(pg_chacon_lg "switching_$1" "$2")"
      local dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
      local cmd="sudo ./$dir/chacon_send 0 $pg_chacon_num $address $1"
      $verbose && jv_debug "$> $cmd"
      eval $cmd | while read line; do jv_debug "$line"; done
      say "$(pg_chacon_lg "switching_$1_done" "$2")"
      return $?
    fi
  done <<< "$(echo $pg_chacon_config | jq -r '.devices[].name')"
  say "$(pg_chacon_lg no_device_matching "$2")"
  return 1
}
