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

**week 2 2/12 - 6/12**

* 2/12 
  + comparing/analysing some e machines
  + memory lengths - compare runtime, complexity
  + relating epsilon machines to shafto + pitts (2012 and 2015) results
  +to do:
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
    
* 3/12
  + e machine complexity and runtime plotting/preliminary analysis
  + to do: 
    + plot complexities for all channels, accross conditions and memory lengths (topographic map) - massive
    + compare median split and derivative - methods and trial numbers
    + compare regions, iit vs gnw
    + write actually good loops/structures for massive not just hardcode
    + find rationale for channel location/selection

* 4/12
  + cssr installation in linux vm
  + fixed windows/linux newline character issues (windows \r\n and linux \n)
  + create shared folder between home windows and linux vm
  + need to compare csm and cssr machines
  
* 5/12
  + comparison of cssr and csm
  + vm shared folder - need to mount each reboot
  
* 6/12
  + generated some eMs with cssr for different mmls
  + cleanup directories/files --> updated workflow following munoz paper groupings
  + update progress slides
  + to do:
    + Compute, plot & predict runtime and more complexities for CSSR
    + compare median split and differentiated data
    + make more eMs for more channels, mmls: compare frontal, occipital, parietal channels
    + eMs topography
    + Compare eMs over whole condition (Yota's comment)
    + Fix ml errors
    + fix linux matlab installation errors

**week 3 9/12 - 13/12**

* 9/12
  + wrangling linux vm
  + [resized partition](http://derekmolloy.ie/resize-a-virtualbox-disk)
  + vm matlab cssr
    + generate and plot runtimes and complexities
    + to do: compare to command line cssr, other stuff from last week
    
* 10/12
  + generate ems for occipital channels of memory lengths
  + plot complexity difference vs memory length - need to avg across channels?
  + basic occipital topography of complexities for phase 1 face vs random
  + see ppt for to do

* 11/12
  + plotting complexities
  
* 12 - 13/12
  + general eM generation and exploration
  + refined focus and explore relevance to IIT at lab meeting

**week 3 9/12 - 13/12**

* 16/12
  + sped up vm with 3d rendering enabled
  + made a big loop to compute all channels/memory lengths
  + need to learn how to use massive & write some documentation
  
* 17/12
  + learning bash/massive
  + generate some more frontal/occipital eMs
  + need to submit jobs to massive + update progress slides