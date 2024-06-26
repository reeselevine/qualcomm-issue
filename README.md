This repository reproduces a potential Qualcomm Adreno driver bug. It includes the SPIR-V code that causes an error, both assembled and dis-assembled, as well as setup code that can reproduce the issue.

## Issue

The shader included in this repository leads to a crash when trying to run on a Qualcomm Adreno 740. The shader was originally written in OpenCL, and then compiled to SPIR-V using [clspv](https://github.com/google/clspv). The shader seems to be a minimal example that leads to the crash; all the operations in the shader are necessary. The same shader works on GPUs from other vendors.

## System Information

This was tested on a Qualcomm Adreno 740 running in a OnePlus 11 5G. Here is the output using `adb logcat` with information about the driver and error:

```
06-25 21:32:23.707 29995 29995 I AdrenoVK-0: QUALCOMM build          : 1a285a84ae, I2991b7e11e
06-25 21:32:23.707 29995 29995 I AdrenoVK-0: Build Date              : 06/04/23
06-25 21:32:23.707 29995 29995 I AdrenoVK-0: Shader Compiler Version : E031.41.03.36
06-25 21:32:23.707 29995 29995 I AdrenoVK-0: Local Branch            :
06-25 21:32:23.707 29995 29995 I AdrenoVK-0: Remote Branch           :
06-25 21:32:23.707 29995 29995 I AdrenoVK-0: Remote Branch           :
06-25 21:32:23.707 29995 29995 I AdrenoVK-0: Reconstruct Branch      :
06-25 21:32:23.707 29995 29995 I AdrenoVK-0: Build Config            : S P 14.1.4 AArch32
06-25 21:32:23.707 29995 29995 I AdrenoVK-0: Driver Path             : /vendor/lib/hw/vulkan.adreno.so
06-25 21:32:23.707 29995 29995 I AdrenoVK-0: Driver Version          : 0676.32
06-25 21:32:23.707 29995 29995 I AdrenoVK-0: PFP                     : 0x01740158
06-25 21:32:23.707 29995 29995 I AdrenoVK-0: ME                      : 0x00000000
06-25 21:32:23.707 29995 29995 I AdrenoVK-0: Application Name    : EasyVK Application
06-25 21:32:23.707 29995 29995 I AdrenoVK-0: Application Version : 0x00000000
06-25 21:32:23.707 29995 29995 I AdrenoVK-0: Engine Name         : Heterogeneous Programming Group
06-25 21:32:23.707 29995 29995 I AdrenoVK-0: Engine Version      : 0x00000000
06-25 21:32:23.707 29995 29995 I AdrenoVK-0: Api Version         : 0x00403000
06-25 21:32:23.730 29995 29995 I AdrenoVK-0: Shader compilation failed for shaderType: 5
06-25 21:32:23.730 29995 29995 I AdrenoVK-0: Pipeline create failed
```

