# Optimizing COVID-19 quarantine and testing strategies
 Chad R. Wells*, Jeffrey P. Townsend*, Abhishek Pandey, Gary Krieger, 
Seyed M. Moghadas, Burton Singer, Robert H. McDonald, Alison P. Galvani 
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
