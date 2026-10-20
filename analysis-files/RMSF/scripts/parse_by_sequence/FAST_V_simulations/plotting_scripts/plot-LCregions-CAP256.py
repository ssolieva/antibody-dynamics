import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

BASE_PATH = "/mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/analysis/RMSF"

sim_names = ['CAP256_naive_V', 'CAP256_I01_V','CAP256_I03_V','CAP256_I04_V','CAP256_mature_V']
lineage = 'CAP256'
colors = ['#80bfff','palevioletred','pink','pink','#004080']
xlabels = ['Naive','I01','I03','I04','Mature']

width = 0.15

chain='LC'
region_list = ['R1']
region_labels=['1']
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

plt.figure(figsize=(1.4, 1.4))
x = np.arange(len(region_list))
for i, sim in enumerate(xlabels):
    means = np.array([region_rmsfs[region]["mean"][i] for region in region_list])
    low = np.array([region_rmsfs[region]["low"][i] for region in region_list])
    high = np.array([region_rmsfs[region]["high"][i] for region in region_list])
    yerr = np.vstack([means - low,high - means])
    plt.bar(x + i*width,means,width=width,yerr=yerr,label=sim,color=colors[i],edgecolor='black',capsize=2,linewidth=0.5, error_kw=dict(capthick=0.2, elinewidth=1))


plt.xticks(x + (2*0.15), region_labels, fontsize=6)
plt.xlabel(f'{chain} Region', fontsize=6, weight='bold', labelpad=0)

#plt.xticks(x + width*2, region_labels, fontsize=6)
#plt.xlabel('HC Region', fontsize=6, weight='bold', labelpad=0)
#plt.ylabel('avg. CA RMSF ('+r'$\mathbf{\AA}$'+')', fontsize=6, weight='bold')
#plt.legend(fontsize=6, ncol=1, frameon=False, labelspacing=0, loc="upper left")

plt.ylim(0,9)
plt.yticks([0,4,8,12],fontsize=6)
plt.ylim(0,12)
#plt.title(f'{lineage} lineage HC regions',  weight='bold', fontsize=8)
plt.tight_layout()
plt.savefig(f'{BASE_PATH}/figures/FigS8_to_S14/RMSF_per_given_region_{chain}_{lineage}_variableOnly.pdf', dpi=300, transparent=True, bbox_inches='tight')
