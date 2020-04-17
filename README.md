# SAS CR/LF Remover for REDCap API Data

This repository documents a SAS code snippet that can be used to remove *carriage returns* and *line feeds* within a dataset created from a REDCap database using the REDCap API. The CR and LF characters are known to cause issues and create phantom records when the outputted CSV file is imported into SAS.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- REDCap database
- SAS installed on system
- CSV file containing data exported by the REDCap API

### Installing

Simply copy and insert the code snippet into your SAS code that imports the CSV file into SAS as a dataset. Make sure to modify the filename or the macro that points SAS to your CSV file.

## Built With

* SAS

## Authors

- Sumon Chattopadhyay - *Initial work* - [REDCap@Yale](https://github.com/yale-redcap)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

## Acknowledgments

* This code snippet is a modification of a solution found on the SAS Institute support page, which can be found [here](https://support.sas.com/kb/26/065.html). All credit goes to the initial author of this solution.
