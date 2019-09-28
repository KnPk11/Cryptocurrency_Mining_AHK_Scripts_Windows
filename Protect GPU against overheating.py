# Shuts down computer to prevent overheating over a specified threshold
# Needs Open Hardware Monitor to be running

# v1.0: Initial version

import wmi
from decimal import Decimal
import os


w = wmi.WMI(namespace="root\OpenHardwareMonitor") # Operating system interface, call the OpenHardwareMonitor class
temperature_infos = w.Sensor() # Get all the sensor readings
for sensor in temperature_infos:
	if sensor.SensorType==u'Temperature': # If the sensor collects temperature
		print(sensor.Name)
		sn = sensor.Name
		sv = (round(sensor.Value, 1))
		print(sn + ': ' + str(sv))
		
if sv >= 75: # If temps reach the target
	os.system("rundll32.exe powrprof.dll,SetSuspendState 0,1,0") # Hibernate
		
input("") 