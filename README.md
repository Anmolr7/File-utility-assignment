# File Utility

This is a file utility developed as a submission for Innovaccer HackerCamp 18

## Features

* Can sort all the files except shortcuts in a directory and move them to another directory in separate folders

* Can recursively search for and show a specified number of top files in a directory with their sizes in MB

## How to use

Command | Description
--- | ---
 `./futil sbe src dst` | Sorts all the files except shortcuts in src directory by extension and moves them in separate folders in dst directory
 `./futil biggest-files n dir` | Shows the Top n files in directory dir sorted in descending order with their sizes in MB