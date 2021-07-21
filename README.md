# phantom-examples

Simple test problems and examples for the [Phantom](https://phantomsph.bitbucket.io) Smoothed Particle Hydrodynamics and Magnetohydrodynamics code.

https://github.com/danieljprice/phantom

Each directory contains parameter files (.setup/.in) for the test problems and examples 
presented in Phantom paper ([Price et al. 2018](https://ui.adsabs.harvard.edu/abs/2018PASA...35...31P/abstract)), along with associated files needed to
produce the plots presented in the paper using [splash](http://users.monash.edu.au/~dprice/splash).

# Usage

Most of the directories contain a script called `run.sh' that should be all you need to re-perform the test and make the associated plot:
```
cd hydro/shock
./run.sh
```

At the moment this script assumes the code is located in ~/phantom. If this is not true you should create a soft link i.e.
```
ln -s $PHANTOM_DIR ~/phantom
```

For plotting/visualisations to work you will need splash installed and available in your path.

Some of the other directories are less complete and just contain the .in and .setup files used for the test problem. This repository is a work in progress but allows for reproduction of the tests and figures presented in the original paper, with a few more added since.

Feel free to get in touch if you have suggestions for improvement. Contributions also welcome.

Daniel Price
July 2021
