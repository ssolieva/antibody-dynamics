import pandas as pd
import matplotlib.pyplot as plt
import numpy as np


BASE_PATH    = "/mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/analysis/RMSF"

sim_names = ['PGT121_naive_kappa_VC', 'PGT121_3H3L_VC', 'PGT121_32H3L_VC', 'PGT121_9H3L_VC','PGT121_mature_kappa_VC', 'PGT124_mature_VC']
lineage = 'PGT121'

colors = ['#80bfff','palevioletred','pink','lavenderblush', '#004080' ,'#004080']
xlabels = ['Naive','3H3L','32H3L','9H3L','PGT121','PGT124']

cdr_list = ['CDRH1','CDRH2','CDRH3','CDRL1','CDRL2','CDRL3']
# save everything into a dict
cdr_rmsfs = {cdr: {"mean": [], "low": [], "high": []} for cdr in cdr_list}
for sim_name in sim_names:
    df = pd.read_csv(f"{BASE_PATH}/data/apo/{sim_name}/parsed_avg_cdr_data.csv")
    for cdr in cdr_list:
        rmsf = df[cdr].iloc[1]
        ci_low = df[cdr].iloc[2]
        ci_high = df[cdr].iloc[3]
        cdr_rmsfs[cdr]["mean"].append(float(rmsf))
        cdr_rmsfs[cdr]["low"].append(float(ci_low))
        cdr_rmsfs[cdr]["high"].append(float(ci_high))

plt.figure(figsize=(4, 1.5))
x = np.arange(len(cdr_list))
width = 0.12

for i, sim in enumerate(xlabels):
    means = np.array([cdr_rmsfs[cdr]["mean"][i] for cdr in cdr_list])
    low = np.array([cdr_rmsfs[cdr]["low"][i] for cdr in cdr_list])
    high = np.array([cdr_rmsfs[cdr]["high"][i] for cdr in cdr_list])
    yerr = np.vstack([means - low,high - means])
    plt.bar(x + i*width,means,width=width,yerr=yerr,label=sim,color=colors[i],edgecolor='black')

plt.xticks(x + width*2, cdr_list, fontsize=6, weight='bold')
plt.ylabel('CA RMSF ('+r'$\mathbf{\AA}$'+')', fontsize=6, weight='bold')
plt.legend(fontsize=6, ncol=2, frameon=False)
plt.ylim(0,3.5)
plt.yticks([0,1,2,3],fontsize=6)
plt.title(f'RMSF per CDR loop: {lineage} lineage',  weight='bold', fontsize=8)
plt.tight_layout()
plt.savefig(f'{BASE_PATH}/figures/FigS8_to_S14/RMSF_per_CDR_{lineage}.pdf', dpi=300, transparent=True, bbox_inches='tight')
