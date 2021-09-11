# AI_measurements
 AI voltage and current measurement with a NI cRIO-9064 chassis and 9205, 9208 modules.
 
 Requires LabVIEW 2020 to open. Please reach out if you want it saved for previous versions.
 
### How to run?
There are two programs:
 1. RT/PC_PumpMeas (for measuring the analog input signals)
 2. RT/PC_AInoiseMeas (for characterizing AI noise measurement)

For each of the programs, first open and run RT_xxx.vi and then run PC_xxx.vi. Make sure that the ip address in the PC_xxx.vi matches with the ip address of the Real-Time system.

### Features
- 16 channels of AI voltage from NI 9205 (differential), and 16 channels of AI current from NI 9208.
- Signal conditioning for the AI voltage signals using moving average filters.
- Set the offset and multiplier for each measurement channel.
- Save screenshots of waveforms automatically.
- Saves and retreives configuration settings automatically from a JSON file.
- Save waveform data of all channels as .csv file with the click of a button!

### VIPM Addons required
- [STM Messaging](https://www.vipm.io/package/ni_lib_stm/) 
- [SEH - Structured Error Handler](https://www.vipm.io/package/ni_lib_seh/)
- [JKI State machine](https://www.vipm.io/package/jki_lib_state_machine/)
- [JKI State machine objects](https://www.vipm.io/package/jki_statemachineobjects/)
- [JSONtext](https://www.vipm.io/package/jdp_science_jsontext/)
