NEURON PROGRAM FOR SIMULATING PYRAMIDAL NEURON CONDUCTANCES STATE AND STDP

Delgado JY, Gómez González JF, Desai NS. Pyramidal neuron conductance
state gates spike-timing-dependent plasticity. J Neurosci. 2010 Nov
24;30 (47):15713-25.  doi: 10.1523/JNEUROSCI.3068-10.2010

Folders:

"..\morphology\" : contains the morphology of the model cell
"..\mechanism\"  : contains mechanisms of the model cell
"..\experiment\" : contains experiments and data of simulations


Instructions:

0- Auto-launch from ModelDB and skip to step 3 or:
1- Copy all the folders into your computer.
2- To Compile the mechanisms, you have to execute "clean-compile.bat"
file in folder "..\mechanism\mechanism_cell1\" (for mswin).  For
linux/unix compile the mod files with nrnivmodl.
3- Simulations:

   a) Execute "run.hoc" from "..\experiment\" folder.
   b) Fit the morphology variable (diameter and length of dendrites
   and soma, position and morphology of the spine) and parameters of
   the mechanisms, etc, if it was necessary.
   c) There are two options to run:
          i) One run: Press the "Run" key, in this case, it executes
          one simulation. If you wanted to save the data, you have to
          select a "Number of Folder", for example "1", and if you
          press the key "Save", the data will save in
          "..\experiment\data_1".

          ii) Multi-runs: Press the "Auto Runs" key, in this case, it
          executes multiple simulations. The number of runs is given
          in "..\experiment\Protocols.hoc" file, in addition, it is
          able to define the protocols that you want to apply for
          every run. By default, Delgado et al, 2010 defined the
          position from the spine to the soma for every run. The data
          will save automatically into folders named "data_XX", XX is
          the distance from the spine to the soma.


For questions:
José Francisco Gómez González, jfcgomez@ull.edu.es

Changelog
=========

* 20220924: Update MOD files to avoid declaring variables and functions with the same name. See https://github.com/neuronsimulator/nrn/pull/1992

