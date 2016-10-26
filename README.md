# blender_farm
We're poor and we can't afford to rent a render farm. That's why we collaboratively render animations in OSC and upload them to our servers.

## Usage
* Place the`upload.php` and `renderer.sh` somewhere on your server.
* Create a directory called `uploads` besides the `upload.php` file.
* Let your contributers install blender and curl on their linux machines.
* let them issue this command: `source <(curl -s http://www.oscgeeks.org/CCC/renderer.sh) <start_frame> <end_frame>` where start frame and end frame are replaced with the actual frame numbers.
* Create a google spreadsheet to organize who renders what.
