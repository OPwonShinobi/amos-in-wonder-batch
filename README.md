A test project for me to practise batch and cmd. The source material was a choose-your-own-adventure parody of Alice in Wonderland me and some friends wrote back in high school for our chem class. We wrote it for fun, and looking back, it was incredibly cheesy.

How to run
----------
Click on start.bat or call it from a cmd/powershell console. Enter y or n for enabling image popups, then enter letters when prompted to proceed in the scenes.

Project layout
--------------
The control modules (start, end, and middle.bat) can be easily reused for another project.
They are more or less the same with minor differences:

start.bat is the only file that can be opened directly, the other ones will close if directly opened to avoid undefined behaviour (also skipping to a certain point in the story is just bad story telling).

./txt
	This folder stores the scenarios and story layout. The story 
	letter.txt : this stores that scenario's text
	letterC.txt :  this stores the scenario's next possible paths and any images to display during the current scene 

./img
	This folder stores the optional images for the story 
	
cmdow.exe
	Used to make images that popup easier to see (without it images would appear on top of each other, blocking them). 
	All credits for cmdow goes to https://ritchielawrence.github.io/cmdow/

imgCheck.bat
	Run this to check for rundll32.exe and PhotoViewer.dll on the current machine, both of which are needed to load images properly. 
	Manually running this is optional as the main script will run this script to check anyway.

start.bat
	Run this script to start the game.
	Setup script. Sets up cmd size and saves user image selection.	
	Also loads the first scene.

middle.bat
	Loads every scene (not endings) after the first.

end.bat
	Handles ending scenes.

openImg.bat
	A separate script to open images.
