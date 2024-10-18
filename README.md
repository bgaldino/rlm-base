# Revenue Lifecycle Management Base Foundations

This content of this repository is aimed at automating the creation and/or configuration of environments that require Revenue Lifecycle Management (RLM) functionality.

**The code in this repository is provided on an as-is basis to help with development. The code, examples and processes provided and documented in this repository are not eligible for support directly from Salesforce. Many of the recent enhancements are to support various internal Salesforce deployment processes.**

The main branch is for the generally available (GA) release of Salesforce, currently 252.

This project is designed to work with CumulusCI and SFDMU.  These should both be installed and configured according to their specific documentation.

When these are installed, the main steps are to set a default target org for cci and to run the primary cci flow.
```
cci org default dev
cci flow run prepare_rlm_org
```
This current repository was designed for 250 and has minor adjustments to complete properly in 252.  There are still manual steps required after cci completion to have an operational org.  There is an upcoming 252 release for rlm-base that includes major changes and enhancements - expected release date is before 1 November 2024.

Documentation is currently being written and will be part of this README. 