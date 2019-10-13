# M122 Zusatzaufgabe Linux Bash - Sandro und Daan

You need to estimate the cost of a project. To get an initial overview, you want to 
Software metric SLOC (lines of code without blank lines and comments) of a similar, already 
completed project as a basis for calculation.

### How to start the Script

```
./SlocProject.sh  /home/vmadmin/SlocOrder
```

example outPut
```
Im Projekt wurden 357 Source Lines of Code (SLOC) gezählt.
```


## Built With

* [Bash](https://de.wikipedia.org/wiki/Bash_(Shell)) - The BOURNE-AGAIN Shell
* passion ❤️


## Versioning

We use [SemVer](http://semver.org/) for versioning. 


## Authors

* **Sandro Schmid**  - [GitHub](https://github.com/sandroschmid01)
* **Daan de Dios** - [GitHub](https://github.com/daandedios)


## Checks
- [X] Always run with the bash shell, regardless of what the default shell is on the system.
- [X] A comment header contains at least one typical call to the script task, date, version, and author.
- [X] The call specifies the directory to be examined as a parameter.
- [X] The files to be examined are written in C and C++. The typical file extension for C is .c and for the header file .h. For C++ it is .cpp and also .h.
- [X] When counting lines, the program should not consider the comments with the syntax "/*...*/ and "//..." as well as spaces, see Link
- [X] If temporary files are used, they must be deleted at the end.
