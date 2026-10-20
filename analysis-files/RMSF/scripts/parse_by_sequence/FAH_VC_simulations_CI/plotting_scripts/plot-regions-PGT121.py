import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

#BASE_PATH = "/mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/analysis/per_resi_RMSD"
BASE_PATH = "/mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/FAH-analysis-20260212/RMSF"

sim_names = ['PGT121_naive_lambda_VC', 'PGT121_mature_lambda_VC']
lineage = 'PGT121'

colors = ['#80bfff','#004080']
xlabels = ['Naive','Mature']
width = 0.4

#chain='HC'
#region_list = ['R1']
#region_labels=['1']

chain='LC'
region_list = ['R1','R2','R3','R4']
region_labels=['1','2','3','4']

# save everything into a dict
region_rmsfs = {region: {"mean": [], "low": [], "high": []} for region in region_list}
for sim_name in sim_names:
    df = pd.read_csv(f"{BASE_PATH}/data/apo/{sim_name}/parsed_avg_{chain}_region_data_CI.csv")
    for region in region_list:
        rmsf = df[region].iloc[1]
        ci_low = df[region].iloc[2]
        ci_high = df[region].iloc[3]
        region_rmsfs[region]["mean"].append(float(rmsf))
        region_rmsfs[region]["low"].append(float(ci_low))
        region_rmsfs[region]["high"].append(float(ci_high))

plt_len=1.6
if chain=='HC':
    plt_len=plt_len+0.5
plt.figure(figsize=(plt_len, 1.4))
x = np.arange(len(region_list))
for i, sim in enumerate(xlabels):
    means = np.array([region_rmsfs[region]["mean"][i] for region in region_list])
    low = np.array([region_rmsfs[region]["low"][i] for region in region_list])
    high = np.array([region_rmsfs[region]["high"][i] for region in region_list])
    yerr = np.vstack([means - low,high - means])
    plt.bar(x + i*width,means,width=width,yerr=yerr,label=f'FAH {sim}',color=colors[i],edgecolor='black',capsize=2,linewidth=0.5,  error_kw=dict(capthick=0.2, elinewidth=1))

plt.xticks(x + 0.2, region_labels, fontsize=6)
plt.xlabel(f'{chain} Region', fontsize=6, weight='bold', labelpad=0)

if chain=='HC':
    plt.ylabel('Avg. CA RMSF ('+r'$\mathbf{\AA}$'+')', fontsize=6, weight='bold')

plt.legend(fontsize=6, ncol=1, frameon=False, labelspacing=0, loc="upper left")

plt.ylim(0,7)
plt.yticks([0,2,4,6],fontsize=6)
plt.tight_layout()

FIG_PATH = "/mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/analysis/RMSF"
plt.savefig(f'{FIG_PATH}/figures/FigS8_to_S14/RMSF_per_given_region_{chain}_{lineage}_FAH_CI.pdf', dpi=300, transparent=True, bbox_inches='tight')

