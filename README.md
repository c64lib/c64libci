# c64libci
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![CircleCI](https://circleci.com/gh/c64lib/c64libci/tree/main.svg?style=shield)](https://circleci.com/gh/c64lib/c64libci/tree/main)
[![CircleCI](https://circleci.com/gh/c64lib/c64libci/tree/develop.svg?style=shield)](https://circleci.com/gh/c64lib/c64libci/tree/develop)

Docker image project for running retro assembler tool on CI such as CircleCI.

How to use this image, check here: https://c64lib.github.io/gradle-retro-assembler-plugin/#_circleci

## Used software
This docker image makes use of the following 3rd party software:
* Debian Buster.
* Vice - the Vertasile Commodore Emulator (see https://vice-emu.sourceforge.io/).
* Goattracker - a crossplatform music editor for creating Commodore 64 music (see https://sourceforge.net/projects/goattracker2/).
* Exomizer - a crossplatform cruncher for 8bit machines (see https://bitbucket.org/magli143/exomizer/wiki/Home).

## Change log

### 0.1.5

* Support for Vice `3.3`.
* Support for Exomizer `3.1.1`.
* Support for Goattracker `2.74`.

### 0.1.4

* Support for Java `11`.
* Support for Vice `3.x`.
