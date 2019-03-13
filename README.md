# FS19_GE_Items

This scripts help you with the items in farmingsimulator 19.

## Usage

The scripts can you use in the giants editor.

1) Go to this path (replace 'xxx' with your username!):
  C:\Users\xxx\AppData\Local\GIANTS Editor 64bit 8.1.0\scripts
  
2) Create a folder like 'Items'.

3) Download the 5 scripts and copy it in this folder.

4) Now you can go in the giants editor. You can find now the scripts in the Menu -> Scripts -> Items

5) Open the scripts in the Scripteditor. You must change the paths for your system:

  - Delete Items:
  
  ```
local installPath = "C:/Program Files (x86)/Farming Simulator 2019/"
local savePath = "C:/Users/kevin/Documents/My Games/FarmingSimulator2019/mods/FS19_Vogelsbach/xml/items.xml"
  ```
  
   - Import Items:
  
  ```
local loadPath = "C:/Users/kevin/Documents/My Games/FarmingSimulator2019/mods/FS19_Vogelsbach/xml/items.xml"
  ```
  
   - Load Items:
  
  ```
local installPath = "C:/Program Files (x86)/Farming Simulator 2019/"
local modPath = "C:/Users/kevin/Documents/My Games/FarmingSimulator2019/mods/"
  ```


Now you can use the scripts:

1) Create an empty transformgroup. This is the 'Main-Tg' for the items. 

2) Create an empty transformgroup in the Main-Tg. This is an 'item'. For the default values you can run the script 'Set Item Default'.

3) Set your own values in the userattributes.

4) You can run the script 'Load Items'. Now you can see your Items (Buildings, ...).

5) For export your settings, you can executing the script 'Export Items'.

6) If you will start the game, then you should first delete the loaded items with the script 'Delete Items'.

## Scripts

### Load Items

Select the Main-Tg and run the script. You can now see all items.

### Export Items

Select the Main-Tg and run the script. The items are now saved in your items.xml.

### Delete Items

Select the Main-Tg and run the script. All items (only the visiblte parts!) are now deleted in the giants editor.

### Import Items

Select the Main-Tg and run the script. It will now import all items from the items.xml.

### Set Item Default

This script add default userattributes. Select the Item-Tg and execute the script. After executing, you can set your own content.

## Bugs
The script for import items don't import the farmId! Giants have a bug, so I can't set the farmId to the userattribute.
