#!/usr/bin/env python

import matplotlib.pyplot as plt
import numpy as np

data = np.loadtxt('00-memory.txt')

plt.subplot(211)             # the first subplot in the first figure
plt.title('System with NO Vms')		# set the figure title
plt.plot(data[:,0], 'r-')
plt.xlabel('Times (min)')
plt.ylabel('Memory Consumption (MB)')
plt.axis([0, 120, 80, 150])
plt.grid(True)

plt.subplot(212)             # the second subplot
plt.plot(data[:,1], 'b-')
plt.xlabel('Times (min)')
plt.ylabel('Memory Utilization (%)')
plt.axis([0, 120, 0.0, 14.0])
plt.grid(True)


plt.show()
