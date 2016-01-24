# Sparrow

A work in progress IRC Server, written in Swift.

## Installation

Sparrow relies on a TCP/IP library, called Tide, that Swift Package Manger cannot build and so it must be installed independently. To do so run the following:

```
git clone https://github.com/iachievedit/Tide
cd Tide
sudo make install
```

The rest of the project can now be installed, regularly, by running the following:

```
git clone https://github.com/FrancisBaileyH/Sparrow
cd Sparrow
swift build
```
