### **summer project 2019/2020**
2019/2020 internship at mbi

* epsilon machines on human eeg data from shafto and pitts attentional blindness eeg task
* supervised by nao tsuchiya, angus leung, yota kawashima

**week 1 25/11 - 29/11**

* 25/11 - initial setup of matlab/eeglab, data, etc
  + fixed version errors
  + read some more papers about eeg + attentional blindness 

* 26/11 - fixed git, initial matlab/eeglab exploration
  + tracking progress so far in readme doc with [r markdown](https://rmarkdown.rstudio.com/authoring_basics.html)
  + [eeglab tutorial](https://sccn.ucsd.edu/wiki/Main_Page)
  + exploring shafto eeg data (see images folder)
  + re reference in eeglab (probably unneeded)
  + export variables of interest to new file
  + to do: filter vmrk 
  
* 27/11 - git explosion, vmrk filter
  + fixed git push issue (files too large)
  + explore vmrk filtering + old resources (drive and repo)
  + to do: filter, investigate drive/old repo further
  
* 28/11
  + explore evangeline's IIT code
  + add gitignore for large .mat files, back them up on google drive
  + binarised and exported to txt files median data
  + to do: differentiated txt files had strange values and were large - fix?
  + to do: build epsilon machines for each channel/binarisation methods?, optimise?, check or filter channels and other workspace data
   
* 29/11
  + channel filtering for cssr
  + generated some first e machines for some random occipital + some frontal channels face vs random
  + [progress google slides](https://docs.google.com/presentation/d/1J-2n9FFrJaEmSmRfWbBLfJKwWVFQu98Cbb28ATD8ZoI/edit?usp=sharing)
  + to do: compare 11 and 12 (face vs random inattention blindness)
  + compare lmax length (munoz paper) and channel locations - frontal vs occipital
  + clean up files/documentation

* 2/12 to do:
  + shafto & pitts paper:
    + N170, van, p3b, sn
    + Investigate parietal, hemispheres, phases depending on significance?
    + Between noticers/blind group?
  + E machines 
    + Memory length
    + Runtime
    + Complexity
    + derivative vs median split?
  + General
    + Literature - specific channels/erps, time optimisation, perception/attention
