start /d D:\Batch /w D:\Batch\system\start_sas.bat -sysin sascode\Job1\first_program.sas -sasinitialfolder D:\Batch -log logs\Job1\first_program_20160923_121310.log -sasuser work -nosplash -batch -noterminal -logparm "rollover=session" -sysparm prod:job_name=Job1:date_stamp=20160923_121310
start /d D:\Batch /w D:\Batch\system\start_sas.bat -sysin sascode\Job1\second_program.sas -sasinitialfolder D:\Batch -log logs\Job1\second_program_20160923_121310.log -sasuser work -nosplash -batch -noterminal -logparm "rollover=session" -sysparm prod:job_name=Job1:date_stamp=20160923_121310
