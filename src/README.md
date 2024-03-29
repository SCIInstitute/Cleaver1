### Cleaver - A MultiMaterial Tetrahedral Meshing Library and Application
Jonathan Bronson  
Scientific Computing & Imaging Institute  
University of Utah  

Project page: http://www.sci.utah.edu/cleaver  
Mailing list: cleaver@sci.utah.edu  
Contact:      bronson@sci.utah.edu  

The Cleaver Library is based on the 'Lattice Cleaving' algorithm:

> Bronson J., Levine, J., Whitaker R., "Lattice Cleaving: Conforming
> Tetrahedral Meshes of Multimaterial Domains with  Bounded Quality".
> Proceedings of the 21st International Meshing Roundtable
> (San Jose, CA, Oct 7-10, 2012)

The method is theoretically guaranteed to produce valid meshes with bounded
dihedral angles, while still conforming to multi-material material surfaces. 
Empirically these bounds have been shown ot be significant. 

#### SUPPORTED PLATFORMS:

The Cleaver Library is written in C++. It is designed to be cross-platform 
and has been successfully compiled on Windows 7, Mac OSx, and Linux. Binary 
forms will be available on the Cleaver project page.

#### BUILDING CLEAVER:

    cmake [src]
    make
Alternatively, if you do not wish to build the command line program
(which requires the Teem Library) use ccmake to disable it.

#### USAGE:

*What Can Cleaver Do?*

   Cleaver generates conforming tetrahedral meshes for
   multimaterial or multiphase volumetric data. Both 
   geometric accuracy and element quality are bounded. 
   The method is a stencil-based approach, and relies
   on an octree structure to provide a coarse level of
   grading in regions of homogeneity.

*What does Cleaver use as input?*

   The cleaving algorithm works by utilizing indicator
   functions. These functions indicate the strength or
   relative presence of a particular material. At each
   point, only the material with the largest indicator
   value is considered present. In practice, inside-
   outside and distance functions are most common.

*What is the input format?*

   The cleaver library takes as input an instance of the
   Cleaver::Volume class. The Volume is a collection of
   Cleaver::ScalarField's, along with a sampling rate.
   The Cleaver::ScalarField class is an abstract class,
   that can be extended by users to create arbitrary inputs.
   We provide the FloatField class for loading 3D arrays of
   floating point data. The Cleaver command-line tool also
   offers convenience functions for loading the teem NRRD
   image format into the FloatField format.

*What is the output format?*

   The Cleaver Library returns a Cleaver::TetMesh object.  
   This object supports direct output to file in several formats:  
    1. TetGen:  .node, .ele  
    2. SCIRun:  .pts,  .elem, .txt  
    3. Matlab:  .mat  

#### BUGS / FEATURE REQUESTS

Some geometric operations in this code do not yet use proper predicates,
and are therefore not guaranteed safe for all possible input fields. This
is something we will work towards fixing in later releases. In the mean
time, if you have data that you unable to mesh with Cleaver, contact us,
and we will work with you to get it running.
