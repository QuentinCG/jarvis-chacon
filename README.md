## Description
Control DIO Wireless wall switches (ON/OFF) with <a target="_blank" href="http://domotiquefacile.fr/jarvis/">Jarvis assistant</a>.


<img src="https://raw.githubusercontent.com/QuentinCG/jarvis-chacon/master/presentation.jpg" width="800">


## Usage
```
You: Allume la cuisine
Jarvis: Cuisine allumée
[Prise electrique de la cuisine allumée]

You: Eteins la cuisine
Jarvis: Cuisine éteinte
[Prise electrique de la cuisine éteinte]
```


## How to install

1) Connect a 433MHz RF sender module to the Raspberry Pi by following this schema:

<img src="https://raw.githubusercontent.com/QuentinCG/jarvis-chacon/master/rpi_433MHzSender.jpg" width="300">

2) Add this plugin to your <a target="_blank" href="http://domotiquefacile.fr/jarvis/">Jarvis assistant</a> (<a target="_blank" href="http://domotiquefacile.fr/jarvis/content/plugins">more info here</a>): ```./jarvis.sh -p https://github.com/QuentinCG/jarvis-chacon```

3) Configure the <a target="_blank" href="https://github.com/QuentinCG/jarvis-achacon/blob/master/config.sh">configuration file</a> to match your requirements (use any chacon number if you don't have remote controler).

4) Pair the wireless wall switches with your Raspberry Pi (to do with all your switches): Connect your wireless wall switch and in the 5 seconds, send a "ON" command to the switch (`Allume la cuisine` for example)

5) Enjoy


## Author
[Quentin Comte-Gaz](http://quentin.comte-gaz.com/), forked from [Lusitanos67](https://github.com/Lusitanos67/jarvis-chacon)


## License

This project is under MIT license. This means you can use it as you want (just don't delete the plugin header).


## Contribute

If you want to add more examples or improve the plugin, just create a pull request with proper commit message and right wrapping.
