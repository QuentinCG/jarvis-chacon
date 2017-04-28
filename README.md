## Description
This plugin uses mochad to control your X10 devices.
It will allow you to simply turn on and off your devices.
For now needs wiring pre-installed, this will be automated in an update.
See https://arno0x0x.wordpress.com/2015/04/02/rf433-outlet/

## Configuration

1. Indicate the controler code uses (default:12325261):
   
   ```
   pg_chacon_num=12325261
   ```
   
2. List your device names & corresponding addresses in `json` format
   
   ```
   pg_chacon_config='{ "devices":[
    { "name": "SALON", "address": "1"},
    { "name": "SALLE A MANGER", "address": "2"},
    { "name": "CUISINE", "address": "3"}
    ]}'
   ```

## Usage
    
   Français
    
   ```
   Vous: allume le bar
   Jarvis: J'allume le bar...
   # > ...
   Jarvis: C'est fait...
   ```
    
   English
    
   ```
   You: turn on the bar
   Jarvis: Switching on the bar...
   ```

## Author
Forked from [Lusitanos67](https://github.com/Lusitanos67/jarvis-chacon)
