# Optimizing COVID-19 quarantine and testing strategies
 Chad R. Wells*, Jeffrey P. Townsend*, Abhishek Pandey, Gary Krieger, 
Seyed M. Moghadas, Burton Singer, Robert H. McDonald, Alison P. Galvani 

Copyright (C) <2020>, Chad R. Wells et. al. All rights reserved. Released under the GNU General Public License (GPL)

This repository contains codes and data used to simulate and analyze COVID-19 quarantine and testing strategies in the scenarios of 
1. Entry into quarantine uniformly during the incubation period or the course of disease 
2. Entry into quarantine through contact tracing

The model code is written in MATLAB and results are saved as MATLAB data files (extension .mat), with plots also being constructed in MATLAB. As MATLAB is not an open-source software/programming language, a compatible code that can be run using GNU Octave can be found in the directory named Octave in the repository.

## OS System requirements
The codes developed here are tested on Windows operating system (Windows 10 Home: 64-bit). However as Matlab and Octave are available for most operating systems, codes should run on Mac OSX and Linux as well.

## Installation guide
### MATLAB
Installation instruction for MATLAB can be found at https://www.mathworks.com/help/install/install-products.html. Typical install time for MATLAB on a "normal" desktop is around 30-40 minutes. The current codes were developed and tested on MATLAB R2018b.
### GNU Octave
When MATLAB is not accessible due to lack of license or any other reason, the open-source GNU Octave can be used to test the code. We tested our code with GNU Octave version 4.2.2. Necessary adjustment to code was done to make it compatible with GNU Octave and it can be found in the directory named Octave in the repository. Installation instruction for GNU octave can be found at https://www.gnu.org/software/octave/. Typical install time for GNU Octave on a "normal" desktop is 15 minutes or less. As most data is saved in MATLAB data file format as well, they can be read directly in GNU Octave for speed. If testing the code that reads the raw data and formats them (format_data.m), it may be essential to install 'io' package in GNU Octave and can be installed using pkg install -forge io, which can then be loaded in work environment using pkg load io

## Demo
Figure1 generates Figure 1 in the main text; Figure S2 and Figure S3 (Run Time: 22 seconds). All mat files to run this script are avaialble. This figure script requires the scripts IPQ,ITE,ITXD, and ITEXD to be run if parsmeters changed in the analysis in order to update 'ImpactQuarantine.mat'; 'TestingonEntry.mat'; 'TestingonExit_OneDayDelay.mat'; 'TestingonEntryExit_OneDayDelay.mat'. Estimated run times on 6 processor in parallel 

## Instructions for use
To generate the Figures and output of the calculations, select a script from Figures section to run in MATLAB and enter the name in the command line. All mat file are availble to generate figures and conduct the calculations. To run analysis on a different set of parameters, adjust the parameters in the script and enter the name of the script in the command line to run.

## Analysis scripts
### IS
Generates the infectivity profile for R0=2.5 and R0=2.0, as well as pA=30.8% and pA=22.6%.
### IPQ
Runs the analysis for uniform entry into quarantine with 30.8% infections being asymptomatic, and 22.6% being asymptomatic, for quarantine durations from 0 to 21 days with no testing and R0=2.5
### ITE
Runs the analysis for uniform entry into quarantine with 30.8% infections being asymptomatic, and 22.6% being asymptomatic, for quarantine durations from 0 to 21 days with testing on entry and R0=2.5
### ITX
Runs the analysis for uniform entry into quarantine with 30.8% infections being asymptomatic, and 22.6% being asymptomatic, for quarantine durations from 0 to 21 days with testing on exit (with negligible delay in test result) and R0=2.5
### ITEX
Runs the analysis for uniform entry into quarantine with 30.8% infections being asymptomatic, and 22.6% being asymptomatic, for quarantine durations from 0 to 21 days with testing on both entry and exit (with negligible delay in test result) and R0=2.5
### ITXD
Runs the analysis for uniform entry into quarantine with 30.8% infections being asymptomatic, and 22.6% being asymptomatic, for quarantine durations from 0 to 21 days with testing on exit (with one day delay to obtain test result) and R0=2.5
### ITEXD
Runs the analysis for uniform entry into quarantine with 30.8% infections being asymptomatic, and 22.6% being asymptomatic, for quarantine durations from 0 to 21 days with testing on both entry and exit (with one day delay to obtain test result) and R0=2.5
### ITE4Q7
Runs the analysis for uniform entry into quarantine with 30.8% infections being asymptomatic for quarantine duration of 7 days with testing on both entry and 96 hrs after the first test and R0=2.5
### CT
Runs the analysis for contact tracing with 30.8% infections being asymptomatic, and 22.6% being asymptomatic, for quarantine durations from 0 to 21 days with no testing and R0=2.5
### CTTE
Runs the analysis for contact tracing with 30.8% infections being asymptomatic, and 22.6% being asymptomatic, for quarantine durations from 0 to 21 days with testing on entry and R0=2.5
### CTTX
Runs the analysis for contact tracing with 30.8% infections being asymptomatic, and 22.6% being asymptomatic, for quarantine durations from 0 to 21 days with testing on exit (with negligible delay in test result) and R0=2.5
### CTTEX
Runs the analysis for contact tracing with 30.8% infections being asymptomatic, and 22.6% being asymptomatic, for quarantine durations from 0 to 21 days with testing on both entry and exit (with negligible delay in test result) and R0=2.5
### CTTXD
Runs the analysis for contact tracing with 30.8% infections being asymptomatic, and 22.6% being asymptomatic, for quarantine durations from 0 to 21 days with testing on exit (with one day delay to obtain test result) and R0=2.5
### CTTEXD
Runs the analysis for contact tracing with 30.8% infections being asymptomatic, and 22.6% being asymptomatic, for quarantine durations from 0 to 21 days with testing on both entry and exit (with one day delay to obtain test result) and R0=2.5
### VPAD
Runs the analysis for uniform entry into quarantine for quarantine durations of five and seven days days with testing on both entry and 96 hrs after the first test and R0=2.5 for 0% to 100% (at 5% increase in incrementes) infections being asymptomatic.
### VPANT
Runs the analysis for uniform entry into quarantine for quarantine durations of five and seven days days with no testing and R0=2.5 for 0% to 100% (at 5% increase in incrementes) infections being asymptomatic.
### Prob_Estimate_Data
Returns the estimates for the benefit of extending the quarantine from three-day and test on entry to a five/seven day quarantine with testing on entry and testing 96 hrs follwoing first test. Also, calcualtes the probability of post-quarantine transmission for the cases detected on exit.
### DayTest
Computes the number of secodnary infections for quarantine durations for 0 to 21 days, as well as evaluting the number of secondary infections if tested on day X of quanratine. 
### EstimatingInfectioncurves
Estimates the shape paramters for the infectivity profile curves fit to 12.3 days, 5 days, 8 days, and 11 days for the incubation period.
## Figures
### FigureGen 
Generates all figures in the main text and the supplementary material
### Figure 1
Constructs the line graph of the probability of post-quarantine transmission for quarantine for the scenarios of i) no testing, ii) texting on entry, iii) testing on exit, and iv) testing on both entry and exit for an incubation period of 8.29 days (95% credible interval of 7.69–8.92 days), as well as an incubation period of 5.2 days (95% credible interval of 3.8–6.7 days). 

This script also generates Figure S2 (Secondary number of cases post-quarantine) and Figure S3 (Probability of post-quarantine transmission).
### Figure 2
Constructs the bar graph of the positivity for the testing data from the two site for the different strategies (testing only on entry versus testing on entry and exit).
### Figure 3
Constructs the line graph of the probability of post-quarantine transmission for contact tracing for the scenarios of i) no testing, ii) texting on entry, iii) testing on exit, and iv) testing on both entry and exit for an incubation period of 8.29 days (95% credible interval of 7.69–8.92 days), as well as an incubation period of 5.2 days (95% credible interval of 3.8–6.7 days). 

This script also generates Figure S7 and Figure S8.
### FigureS1
Plots the infectivity profile for R_0=2.5 and 30.8% infections being asymptomatic,  R_0=2.5 and 22.6% infections being asymptomatic, R_0=2.0 and 30.8% infections being asymptomatic, and R_0=2.0 and 22.6% infections being asymptomatic.
### FigureS4
Plots the optimal time to conduct the test for different quarantine durations
### FigureS5
Plots the probability of post-quarantine transmission for quarantine for a five-day quarantine and a seven day quarantine with no testing and testing on entry and 96 hrs after the initial test for various proportions of infections being asymptomatic
### FigureS6
Plots the probability of post-quarantine transmission for quarantine for a three-day, five-day, seven-day, and 14-day quarnatine, with testing on entry, testing on exit, and testing on entry and exit when accounting for underlying prevalence in the community and a crew size of 40.
### FigureS9_S10
This script generates the figures for the secondary number of cases post-quarantine and probability of post-quarantine transmission when entering quarantine through contact tracing.
### FigureS11
This script generates the infectivity profile for the 8.29 day incubation period and the 5.2 day incubation period
### FigureS12_S13
This script generates the figures for the secondary number of cases post-quarantine and probability of post-quarantine transmission when entering quarantine not through contact tracing and for the incubation period of 5.2 days.
### FigureS14_S15
This script generates the figures for the secondary number of cases post-quarantine and probability of post-quarantine transmission when entering quarantine through contact tracing and for the incubation period of 5.2 days.
### FigureS16_S17
This script generates the figures for the secondary number of cases post-quarantine and probability of post-quarantine transmission when entering quarantine not through contact tracing, with no delay between the test sample and test result (i.e. delay is negligible in receiveing test result)
### FigureS18_S19
This script generates the figures for the secondary number of cases post-quarantine and probability of post-quarantine transmission when entering quarantine through contact tracing, with no delay between the test sample and test result (i.e. delay is negligible in receiveing test result
### FigureS20_S21
This script generates the figures for the secondary number of cases post-quarantine and probability of post-quarantine transmission when entering quarantine not through contact tracing, with 22.6% infections being asymptomatic
### FigureS22_S23
This script generates the figures for the secondary number of cases post-quarantine and probability of post-quarantine transmission when entering quarantine through contact tracing, with 22.6% infections being asymptomatic
### FigureS24_S25
This script generates the figures for the probability of post-quarantine transmission when entering quarantine not through contact tracing, as well as through contact tracing, assuming transmisison post-quarantine is Poisson distributed
## Functions
### BaselineParameters
Returns the baseline parameters for the analysis
### DurationInfected
The duration in which a contact of a symptomatic index case has been infected for
### FigureChart
Generates the Figure chart for the Secondary infections post quarantine and equivialent duration of quaratnine with testing to a duration of quarantine with no testing, assuming delay from sample to result is irrelevant
### FigureChartDelay
Generates the Figure chart for the Secondary infections post quarantine and equivialent duration of quaratnine with testing to a duration of quarantine with no testing, assuming one day delay from sample to result
### InfectiousnessfromInfection
The temporal number of secondary infections post-quarantine given no testing 
### InfectiousnessfromInfectionTestingEntry
The temporal number of secondary infections post-quarantine given single test time (does both entry/exit)
### InfectiousnessfromInfectionTestingEntryExit
The temporal number of secondary infections post-quarantine given timing of two tests
### InfectiousnessfromInfectionTestingMultiple
The temporal number of secondary infections post-quarantine given timing of multiple tests
### PDFavgIncubation
The distribution of the incubation period of 8.29 days
### PDFavgIncubation_Alt
The distribution of the incubation period of 5.2 days
### Probability_Onward
The probability of psot-quarantine transmission given how secondafy cases are distributed
### RiskChart
Generates the Figure chart for the probabaility of post quarantine trasnmisison, assuming delay from sample to result is negligible
### RiskChartDelay
Generates the Figure chart for the probabaility of post quarantine trasnmisison, assuming one day delay from sample to result
### SensitivityTimeSamp
Temporal sensitiviity of the RT-PCR assay starting one day from symptom onset for an incubatino period of 7.76 days
### SensitivityvsViralLoad
The sensitiviity of the RT-PCR assay given the viral load (sigmoidal Hill function)
### TimeInfection
The time in which a contact was infected from a symptomatic index case
### ViralShedding_Asymptomatic
The infectity profile of an asymptomatic individual (independent of R0)
### ViralShedding_Symptomatic
The infectity profile of an symptomatic individual (independent of R0)
## MAT files
### TableData_A
The data for region A
### TableData_B
The data for region B
### Digitized_Incubationperiod
The infectivity profile digitized for 12.3 days
### Digitized_Incubationperiod_5days
The infectivity profile digitized for 5 days
### Digitized_Incubationperiod_8days
The infectivity profile digitized for 8 days
### Digitized_Incubationperiod_11days
The infectivity profile digitized for 11 days
