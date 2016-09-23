# SAS Batch Executor

## Overview

This application spawned from the need for analysts who use SAS to have code execute on a regular automated basis without the need to go to IT or login to the server.

It does **not** replace a complex schedule of dependancies but allows very simple time-based sequential execution   of jobs.

## Grabbing this application

Just execute the following command to grab the application.

```bash
$ git clone https://github.com/atindale/sas-batch-executor.bit
```
## Directory layout

```text
Batch
 ├── logs
 │   ├── job1                 < Log file for each run are created here
 │   │   └── program1_YYYYMMDD_HHMMSS.log
 │   └── job2
 ├── parms
 │   ├── job1.mail            < Run and email parameter file are defined here
 │   ├── job1.run
 │   ├── job2.mail
 │   └── job2.run
 ├── reports
 │   ├── job1                 < Output is created here
 │   │   ├── program1_YYYYMMDD_HHMMSS.html
 │   │   └── program1_YYYYMMDD_HHMMSS.pdf
 │   └── job2
 ├── sascode
 │   ├── job1                 < Flows (jobs) should go under here.
 │   │   ├── program1.sas     < Order is achieve through naming
 │   │   └── program2.sas
 │   └── job2
 │       ├── program3.sas
 │       └── program4.sas
 ├── sasdata
 │   ├── job1                 < SAS data libraries are automatically assigned at this location
 │   └── job2
 ├── system
 │   ├── run_jobs.sas         < Schedule this program to run
 │   ├── run_jobs.bat         < This is generated by run_jobs.sas
 │   ├── init_code.sas
 │   ├── term_code.sas
 │   ├── parse_logs.sas
 │   ├── start_sas.bat
 │   └── logs
 └── sasv9.cfg
```

## Configuring

Depending on your environment you will need to change the following:

- Location of SAS executable in start_sas.bat

## Process

The job `run_jobs.sas` should be scheduled to execute in the morning and afternoon each day. This should be done using whatever scheduling tool is available, such as the built-in Windows Task Scheduler or Cron.

The `Batch` directory should be exposed via a file share so that end users can drop their code in it.

The parms directory which should contain two files for each “flow”:

- Job1.mail
- Job1.run

The `run` parameter file should contain:

```text
# This is Job1
#
SCHEDULE:AM:WEEKLY_1
Job1\first_program.sas
Job1\second_program.sas
```

The values for the `SCHEDULE` keyword are:

| Parameter     | Meaning |
| --- | --- |
| AM/PM         | Morning or afternoon |
| DAILY         | Daily |
| DAILY_BD      | Daily on business days |
| WEEKLY_1      | Weekly on the first day of the week |
| MONTHLY_1     | Monthly on the nth day of the week |
| MONTHLYBD_1   | Monthly on business day n |

## To Do
1.	Add a sasautos/format/autoexec location
2.	Set current_load_date in init_stmt
3.	Have run_jobs.sas create any logs/reports/sascode/sasdata
4.	Refine output styling process and document

## Further Enhancements

1. Have some process for adding a flow and creating a directory (make?)
