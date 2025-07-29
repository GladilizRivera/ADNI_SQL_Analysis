# Alzheimer’s Biomarker Analysis with SQL (ADNI Data)

This project explores key cerebrospinal fluid (CSF) biomarkers—amyloid-beta (Aβ42), total tau, and phosphorylated tau (p-tau)—across clinical diagnoses using data from the Alzheimer's Disease Neuroimaging Initiative (ADNI). The analysis focuses on linking biomarkers with diagnosis status, cognitive performance (MMSE), APOE4 carrier status, and demographic data (age, gender, education).

## Project Structure

```
adni-biomarker-sql-project/
│
├── data/
│   ├── basic_biomarker_summary_by_diagnosis.csv
│   ├── biomarkers_vs_mmse.csv
│   ├── apoe4_distribution_by_diagnosis.csv
│   └── full_biomarker_demographic_summary_by_diagnosis.csv
│
├── sql/
│   └── adni_biomarker_analysis_queries.sql
│
├── images/ 
│   └── Tableau dashboards (exported as .png)
│
└── README.md
```

## Analyses

- Group-level summaries of Aβ42, tau, and p-tau by clinical diagnosis (e.g., CN, MCI, AD)
- Correlation-ready table of biomarkers vs MMSE score
- APOE4 distribution across diagnostic categories
- Comprehensive table linking diagnosis, CSF biomarkers, MMSE, age, and APOE4 status

## Data Source

This project uses de-identified, participant-level data from the Alzheimer's Disease Neuroimaging Initiative (ADNI). To access the raw data, users must apply through the [ADNI Data Sharing and Publications page](https://adni.loni.usc.edu/data-samples/access-data/). No individual-level data is shared in this repository.

## Visualizations

This project includes Tableau dashboards highlighting biomarker and cognitive data trends.

| CSF Biomarker Levels by Diagnosis| Bar chart showing average Aβ42, total tau, and p-tau levels for each diagnostic group. Highlights lower Aβ42 and higher tau in Alzheimer's. |
| Biomarkers vs MMSE | Scatterplots showing negative correlations between tau/p-tau and MMSE, and positive correlation for Aβ42. |
| APOE4 Carrier Distribution | Stacked bar chart showing % of APOE4 carriers in each diagnostic group. Clear gradient: CN < MCI < AD. |
| Full Demographic + Biomarker Summary | Combined chart summarizing group-level MMSE, age, APOE4 %, and biomarker levels. Useful for overview comparisons. |

 Tableau dashboards are available in the `/images` folder.
## Tools Used

- MySQL (data import and query)
- CSV (exported aggregates)
- Tableau (for visualization)
- GitHub (documentation and collaboration)

## Next Steps

- Extend analysis to longitudinal changes (e.g., MMSE or biomarkers)

## Contact

Gladiliz Rivera – Clinical Researcher & Data Analyst  
Project assembled as part of a learning portfolio to demonstrate SQL and healthcare data analysis skills.

---

**Note:** All summary tables are based on group-level aggregation and do not contain personally identifiable information.
