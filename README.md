# phantom-examples

Simple test problems and examples for the [Phantom](https://phantomsph.bitbucket.io) Smoothed Particle Hydrodynamics and Magnetohydrodynamics code.

https://github.com/danieljprice/phantom

Each directory contains parameter files (.setup/.in) for the test problems and examples 
presented in Phantom paper (Price et al. 2018), along with associated files needed to
produce the plots presented in the paper using [splash](http://users.monash.edu.au/~dprice/splash).

# Usage

Some of the directories contain a script called `run.sh' that should be all you need to re-perform the test:
```
cd hydro/shock
./run.sh
```

At the moment this script assumes the code is located in ~/phantom. If this is not true you should create a soft link i.e.
```
ln -s $PHANTOM_DIR ~/phantom
```

For visualisations to work you will need splash installed and available in your path.

Some of the other directories are less complete. This repository is a work in progress but allows for full reproduction of the tests presented in the original paper.

Feel free to get in touch if you have suggestions for improvement. Contributions also welcome.

Daniel Price
July 2021
