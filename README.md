# herokuapp_pinger
A script to ping the heroku app dyno and prevent it  from sleeping, with the notification for linux distros for success and failure



# SETUP

## Requirements

* crontab
* notify-send
* curl

## STEPS

### First of all clone the repository or download it

Extract the archive file and rename the folder from 
```bash
herokuapp_pinger-master
```
to
```bash
herokuapp_pinger
```

#### Now follow the steps

1. Place the repository folder inside the `home/${USER}/` directory.

	It will look like:
	```bash
	/home/${USER}/herokuapp_pinger/
	```
	
2. Open the script `pinger.sh` inside `herokuapp_pinger` folder with any text editor and replace the DUMMY_USER_NAME on the line 46 with your account name.

2. Go inside the `herokuapp_pinger`	 folder and run

	```
	chmod +x pinger.sh && mkdir logs && mkdir csv_logs
	```
	These two folders will be used to store logs.
	`csv_logs` folder will store logs in the form of CSV files and the `logs` folder will store them with `.log` extension
	
	
3. Add the hosts to the `hosts_list.txt` file inside `herokuapp_pinger/script_data` folder.
    
    **Every host url should be on a new line**
    
    **NOTE: There should be a new empty line after the last host otherwise last entry in the file will not be read**
    
    **ALSO ANY NUMBER OF HOSTS CAN BE SPECIFIED IN THE `hosts_list.txt` file**

4. Setup crontab like this: 
   ```bash
   * * * * * /home/your_user_name/herokuapp_pinger/pinger.sh
   ```
   **You should change the crontab schedule according to your needs as \* \* \* \* \* will run the script every minute**

---

## Your logs will be inside 
```bash
/home/${USER}/herokuapp_pinger/logs/
```
### and
```bash
/home/${USER}/herokuapp_pinger/csv_logs/
```

---

## SETUP FINISHED, ENJOY !
