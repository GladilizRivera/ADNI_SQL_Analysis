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
├── images/ (optional)
│   └── plots, charts exported from Python or Tableau
│
└── README.md
```

## Key Analyses

- Group-level summaries of Aβ42, tau, and p-tau by clinical diagnosis (e.g., CN, MCI, AD)
- Correlation-ready table of biomarkers vs MMSE score
- APOE4 distribution across diagnostic categories
- Comprehensive table linking diagnosis, CSF biomarkers, MMSE, age, and APOE4 status

## Data Source

This project uses de-identified, participant-level data from the Alzheimer's Disease Neuroimaging Initiative (ADNI). To access the raw data, users must apply through the [ADNI Data Sharing and Publications page](https://adni.loni.usc.edu/data-samples/access-data/). No individual-level data is shared in this repository.

## Tools Used

- MySQL (data import and query)
- CSV (exported aggregates)
- Tableau (for visualization)
- GitHub (documentation and collaboration)

## Next Steps

- Add Tableau dashboards or Python plots to the `/images` folder
- Extend analysis to longitudinal changes (e.g., MMSE or biomarkers)
- Integrate MRI or PET biomarkers in future versions

## Contact

Gladiliz Rivera – Clinical Researcher & Aspiring Data Analyst  
Project assembled as part of a learning portfolio to demonstrate SQL and healthcare data analysis skills.

---

**Note:** All summary tables are based on group-level aggregation and do not contain personally identifiable information.