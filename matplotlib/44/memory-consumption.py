#!/usr/bin/env python

import matplotlib.pyplot as plt
import numpy as np

data11 = np.loadtxt('11-memory.txt')
data44 = np.loadtxt('44-memory.txt')

#plt.subplot(211)             # the first subplot in the first figure
#plt.title('memory consumption between four vms [2*(linux + windows)] and four vms [2*linux + 2*windows]')		# set the figure title
plt.plot(data44, 'r-', label="2*linux+2*windows")
plt.plot(data11*2, 'b-', label="2*(linux+windows)")
plt.xlabel('Times (min)')
plt.ylabel('Memory Consumption (MB)')
plt.axis([0, 120, 1500, 1700])
plt.grid(True)
plt.legend(bbox_to_anchor=(0., 1.02, 1., .102), loc=4,
		       ncol=2, mode="expand", borderaxespad=0.)
plt.show()
