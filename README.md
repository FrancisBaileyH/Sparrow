# Sparrow

A (very) work in progress IRC Server, written in Swift. Currently only connection registration works. I'm in the process of future proofing the code base before implementing new commands and features.

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
