# AI_measurements
 AI voltage and current measurement with a NI cRIO-9064 chassis and 9205, 9208 modules.
 
 Requires LabVIEW 2020 to open. Please reach out if you want it saved for previous versions.
 
### How to run?
There are two programs:
 1. RT/PC_PumpMeas (for measuring the analog input signals)
 2. RT/PC_AInoiseMeas (for characterizing AI noise measurement)

For each of the programs, first open and run RT_xxx.vi and then run PC_xxx.vi. Make sure that the ip address in the PC_xxx.vi matches with the ip address of the Real-Time system.

### VIPM Addons required
- [STM Messaging](https://www.vipm.io/package/ni_lib_stm/) 
- [SEH](https://www.vipm.io/package/ni_lib_seh/)
- [JKI State machine](https://www.vipm.io/package/jki_lib_state_machine/)
- [JKI State machine objects](https://www.vipm.io/package/jki_statemachineobjects/)
- [JSONtext](https://www.vipm.io/package/jdp_science_jsontext/)
