#!/usr/bin/env python

import matplotlib.pyplot as plt
import numpy as np

data = np.loadtxt('01-memory.txt')

plt.subplot(211)             # the first subplot in the first figure
plt.title('System with one Linux Vm')		# set the figure title
plt.plot(data[:,0], 'r-')
plt.xlabel('Times (min)')
plt.ylabel('Memory Consumption (MB)')
plt.axis([0, 120, 150, 300])
plt.grid(True)

plt.subplot(212)             # the second subplot
plt.plot(data[:,1], 'b-')
plt.xlabel('Times (min)')
plt.ylabel('Memory Utilization (%)')
plt.axis([0, 120, 5.0, 20.0])
plt.grid(True)


plt.show()
