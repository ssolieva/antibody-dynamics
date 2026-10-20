import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

BASE_PATH = "/mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/analysis/RMSF"

sim_names = ['Ab118_naive_VC', 'Ab118_I_VC', 'Ab118_IAb2748_VC', 'Ab118_IAb0923_VC','Ab118_mature_VC']
lineage = '1-18'
colors = ['#80bfff','palevioletred','pink','lavenderblush','#004080']

xlabels = ['Naive','I1','I2','I3','Mature']
width = 0.15

chain='HC'
region_list = ['R1','R2','R3','R4']
region_labels=['1','2','3', '4']
# save everything into a dict
region_rmsfs = {region: {"mean": [], "low": [], "high": []} for region in region_list}
for sim_name in sim_names:
    df = pd.read_csv(f"{BASE_PATH}/data/apo/{sim_name}/parsed_avg_{chain}_region_data.csv")
    for region in region_list:
        rmsf = df[region].iloc[1]
        ci_low = df[region].iloc[2]
        ci_high = df[region].iloc[3]
        region_rmsfs[region]["mean"].append(float(rmsf))
        region_rmsfs[region]["low"].append(float(ci_low))
        region_rmsfs[region]["high"].append(float(ci_high))

plt.figure(figsize=(2, 1.4))
x = np.arange(len(region_list))
for i, sim in enumerate(xlabels):
    means = np.array([region_rmsfs[region]["mean"][i] for region in region_list])
    low = np.array([region_rmsfs[region]["low"][i] for region in region_list])
    high = np.array([region_rmsfs[region]["high"][i] for region in region_list])
    yerr = np.vstack([means - low,high - means])
    plt.bar(x + i*width,means,width=width,yerr=yerr,label=sim,color=colors[i],edgecolor='black',capsize=2,linewidth=0.5,  error_kw=dict(capthick=0.2, elinewidth=1))


plt.xticks(x + 0.3, region_labels, fontsize=6)
plt.xlabel(f'{chain} Region', fontsize=6, weight='bold', labelpad=0)

#plt.xticks(x + width*2, region_labels, fontsize=6)
#plt.xlabel('HC Region', fontsize=6, weight='bold', labelpad=0)
plt.ylabel('avg. CA RMSF ('+r'$\mathbf{\AA}$'+')', fontsize=6, weight='bold')
#plt.legend(fontsize=6, ncol=2, frameon=False, labelspacing=0, loc="upper left")
plt.ylim(0,6)
plt.yticks([0,2,4,6],fontsize=6)
#plt.title(f'{lineage} lineage HC regions',  weight='bold', fontsize=8)
plt.tight_layout()
plt.savefig(f'{BASE_PATH}/figures/FigS8_to_S14/RMSF_per_given_region_{chain}_{lineage}.pdf', dpi=300, transparent=True, bbox_inches='tight')








